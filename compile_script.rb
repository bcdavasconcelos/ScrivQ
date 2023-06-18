#!/usr/bin/env ruby
# encoding: utf-8

# This script rewrites markdown from Scrivener to be compatible with
# the cross-referencing system used by Quarto. It also adds paths for
# LaTeX, python and others so that compilation works directly from
# Scrivener (which by default doesn't use the user environment).
# Version: 0.1.8
# Modified by Bernardo Vasconcelos to use the inline_fn method from
# the inline_fn gem.

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

require 'tempfile' # temp file tools
require 'fileutils' # ruby standard library to deal with files
require 'timeout'
#require 'debug/open_nonstop' # debugger

dry_run = false # set to true to test without overwriting the file

def inline_fn(str, style = :pandoc)
  return str unless str.is_a?(String) && !str.empty? && str.include?('[^')

  ref_start = ''
  text = str
  counter = 0

  until ref_start.nil?
    counter += 1
    cite      = "[^#{counter}]"
    ref       = "[^#{counter}]:"
    ref_start = text.index(ref)
    break if ref_start.nil?

    next_ref = "[^#{counter + 1}]:"
    ref_end  = text.index(next_ref).nil? ? -1 : text.index(next_ref) - 2
    offset   = counter.to_s.length + 5
    note     = case style
               when :mmd
                 "[^#{text[ref_start + offset..ref_end].strip}]"
               else
                 "^[#{text[ref_start + offset..ref_end].strip}]"
               end

    text = text.gsub(cite, note)
  end

  if counter >= 1
    case style
    when :mmd
      text = text.gsub(/\n\s*\[\^/, "\n[^")
      cut_point = text.index("\n[^")
    else
      text = text.gsub(/\n\s*\^\[/, "\n^[")
      cut_point = text.index("\n^")
    end

    text = text[0, cut_point]
    puts "--> #{counter -= 1} notes replaced."
  end
  text
end

def inline_fn_pandoc(text)
  inline_fn(text, :pandoc)
end

def inline_fn_mmd(text)
  inline_fn(text, :mmd)
end

def makePath() # this method augments our environment path
  home = ENV['HOME'] + '/'
  envpath = ''
  pathtest = [home+'.rbenv/shims', home+'.pyenv/shims', '/usr/local/bin',
              '/usr/local/opt/ruby/bin', '/usr/local/lib/ruby/gems/2.7.0/bin',
              '/Library/TeX/texbin', '/opt/homebrew/bin',
              home+'anaconda/bin', home+'anaconda3/bin', home+'miniconda/bin', home+'miniconda3/bin',
              home+'.cabal/bin', home+'.local/bin']
  pathtest.each { |p| envpath = envpath + ':' + p if File.directory?(p) }
  envpath.gsub!(/\/{2}/, '/')
  envpath.gsub!(/:{2}/, ':')
  envpath.gsub!(/(^:|:$)/, '')
  ENV['PATH'] = envpath + ':' + ENV['PATH']
  ENV['LANG'] = 'en_GB.UTF-8' if ENV['LANG'].nil? # Just in case we have no LANG, which breaks UTF8 encoding
  puts "--> Modified path: #{ENV['PATH'].chomp}"
end # end makePath()

def isRecent(infile) # checks if a file is less than 3 minutes old
  return false if !File.file?(infile)
  filetime = File.mtime(infile) # modified time
  difftime = Time.now - filetime # compare to now
  if difftime <= 180
    return true
  else
    return false
  end
end

tstart = Time.now
in_filename = File.expand_path(ARGV[0])
puts "--> Input Filename: #{in_filename}"
fail "The specified file does not exist!" unless in_filename and File.file?(in_filename)

fileType = ARGV[1]
if fileType.nil? || fileType !~ /(plain|markdown|html|pdf|epub|docx|latex|odt|beamer|revealjs|pptx)/
  fileType = ''
end

makePath()
outo_filename = in_filename.gsub(/\.[q]?md$/,".qmd") # output to [name].qmd
to_file = Tempfile.new('fix-x-refs') # create a temp file
lineSeparator = "\n"

begin
  File.open(in_filename, 'r') do |file|
    text = file.read

    # cosmetic only: remove long runs (4 or more) of newlines
    text.gsub!(/\n{4,}/,"\n\n")

    # This regex puts {#id} onto end of $$ math block lines
    text.gsub!(/\$\$ ?\n\{\#eq/,'$$ {#eq')

    # We will move markup for images and figures from the 
    # bottom of the file to their in-line references.
    # From:
    # [Ulysses sailing][Ulysses1]
    # [Ulysses1]: Ulysses1.jpg {width=486 height=402}
    # To:
    # ![Ulysses sailing](Ulysses1.png){#fig-ulysses1 width=486 height=402}

    figures_data = text.scan(/^\[(?<reference>.+?)\]: (?<url>.+?) ?\{(?<dimensions>.+?)\}$/)
    figures_reference = text.scan(/^!\[(?<id>\{#fig-.+?\} ?)(?<cap>.+?)\]\[(?<ref>.+?)\]$/)

    figures_data.each do |data|
      figures_reference.each do |fig|
        next unless data[0] == fig[2] # if the reference matches the figure label

        reference = data[0]
        url = data[1]
        dimensions = data[2]
        id = fig[0]
        cap = fig[1]
        search = "![#{id}#{cap}][#{reference}]"
        text.gsub!(search, "![#{cap.strip}](#{url.strip}){#{id.gsub(/\{|\}/,'').strip} #{dimensions.strip}}")
        puts "Matched #{data[0]} to #{fig[2]}"
      end
      text.gsub!(/^\[(?<reference>.+?)\]: (?<url>.+?) ?\{(?<dimensions>.+?)\}$/, '')
    end

    # New section: Extract and create new files from main file
    # Pattern: <!-- begin_file: "path/to/file.ext" -->`file_content`<!-- end_file -->\n
    if text =~ /<!-- begin_file: "([^"]+)" -->/ # If there are new files to be added
      puts "--> New files detected!"

      text.gsub!(/\[\^fn(\d+)/, '[^\1') if text =~ /\[\^fn\d+/ # Remove the fn prefix from footnotes
      text = inline_fn_pandoc("#{text}\n\n") if text =~ /\[\^\d+\]:/ # Convert footnotes to pandoc style
      new_files = [] # Array to store new files
      text.scan(/<!-- begin_file: "([^"]+)" -->/) do |match|
        # puts "----> Found new file: #{match[0]}"
        new_files << match[0]
      end

      created_files = [] # Array to store created files
      new_files.each do |file|
        begin
          pattern = /<!-- begin_file: "#{file}" -->\n(.+?)\n<!-- end_file -->/m
          file_content = text.scan(pattern)[0][0] # Get the file content
          decrease_heading_cmd = "quarto pandoc -f markdown -t markdown --shift-heading-level-by=-1 --wrap=none"
          # Check if path existis, if not create it
          FileUtils.mkdir_p(File.dirname(file)) unless dry_run
          File.open(file, 'w') { |f| f.write(file_content) } unless dry_run
          #          `#{decrease_heading_cmd} "#{file}" -o "#{file}"` if file[/\.[q]?md$/]
          # puts "----> File #{file} created!"
          created_files << file
          text.gsub!(pattern, '') unless file_content.nil? || file_content.empty?
        rescue
          puts "----> Error: File #{file} not found!"
        end
      end
      puts "--> Created files: #{created_files.join(', ')}"
    else
      puts "--> No new files detected!"
    end

    to_file.puts text
  end
  to_file.close
  FileUtils.mv(to_file.path, outo_filename)
ensure
  to_file.close
  to_file.delete
end

puts "--> Modified File with fixed cross-references: #{outo_filename}"
tend = Time.now - tstart
puts "--> Parsing took: " + tend.to_s + "s"

# Build and run our quarto command
if fileType.empty?
  cmd = "quarto render \"#{outo_filename}\""
else
  cmd = "quarto render \"#{outo_filename}\" --to #{fileType}"
end
puts "\n--> Running Command: #{cmd}"

pid = Process.spawn(cmd)
unless dry_run
  begin
    Timeout.timeout(150) do
      puts 'waiting for the process to end'
      Process.wait(pid)
      puts 'process finished in time'
    end
  rescue Timeout::Error
    puts 'process not finished in time, killing it'
    Process.kill('TERM', pid)
    # open any log file (generated from scrivener's post-processing)
    `open Quarto.log` if File.file?('Quarto.log') and isRecent('Quarto.log')
  end
end
# puts %x(#{cmd})

# now try to open the resultant file
fileType = 'html' if fileType.match(/revealjs|s5|slidous|html5/)
res = outo_filename.gsub(/\.qmd$/, '.' + fileType)
if File.file?(res) && isRecent(res)
  `open "#{res}"`
else
  puts "There was some problem opening "#{res}", check compiler log…"
end
