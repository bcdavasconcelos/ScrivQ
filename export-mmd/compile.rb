#!/usr/bin/env ruby
# encoding: utf-8

# Rewrite of Scrivener markdown for cross-referencing system used by Quarto; also adds paths for LaTeX, python and others.
# Version: 0.1.11 (2024-11-08-17-24)
# Script by [Iandol](https://github.com/iandol) & Bernardo Vasconcelos.

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8
tstart = Time.now

require 'tempfile' # temp file tools
require 'fileutils' # ruby standard library to deal with files
require 'timeout'
#require 'debug/open_nonstop' # debugger

rep_patterns = { /(||)/ => '',
                 /\s+width=/ => ' width=',
                 /{\s*(#.*?)\s*}/ => '{\1}',
                 /\{\s*(.+?)\s*\}/ => '{\1}',
                 /^(#+) (.+?)\{\s*\}/ => '\1 \2',
                 /(\n|\s|\h)+\Z/ => "\n\n",
                 /\n{4,}/ => "\n\n", # cosmetic only: remove long runs (4 or more) of newlines
                 /\$\$ ?\n\{\#eq/ => '$$ {#eq' # puts {#id} onto end of $$ math block lines
}

dry_run = false # set to true to test without overwriting the file
# decrease_heading_cmd = 'quarto pandoc -f markdown -t markdown --shift-heading-level-by=-1 --wrap=none'
in_filename = File.expand_path(ARGV[0])

outo_filename = in_filename.gsub(/\.[q]?md$/,'.qmd') # output to [name].qmd
to_file = Tempfile.new('fix-x-refs') # create a temp file

puts "--> Input Filename: #{in_filename}"

fail 'The specified file does not exist!' unless in_filename && File.file?(in_filename)

fileType = ARGV[1]
if fileType.nil? || fileType !~ /(plain|markdown|html|pdf|epub|docx|latex|odt|beamer|revealjs|pptx)/
  fileType = ''
end

def inline_fn(str, style = :pandoc)
  return str unless str.is_a?(String) && !str.empty? && str.include?('[^')

  ref_start = ''
  text = str.gsub(/\[\^fn(\d+)/, '[^\1') # Remove the fn prefix from footnotes)
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
  home = "#{ENV['HOME']}/"
  envpath = ''
  pathtest = ["#{home}.rbenv/shims", "#{home}.pyenv/shims", '/usr/local/bin',
              '/usr/local/opt/ruby/bin', '/usr/local/lib/ruby/gems/2.7.0/bin',
              '/Library/TeX/texbin', '/opt/homebrew/bin',
              "#{home}anaconda/bin", "#{home}anaconda3/bin", "#{home}miniconda/bin", "#{home}miniconda3/bin",
              "#{home}.cabal/bin", "#{home}.local/bin"]
  pathtest.each {|p| envpath = "#{envpath}:#{p}" if File.directory?(p) }
  envpath.gsub!(/\/{2}/, '/')
  envpath.gsub!(/:{2}/, ':')
  envpath.gsub!(/(^:|:$)/, '')
  ENV['PATH'] = "#{envpath}:#{ENV['PATH']}"
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

makePath()

begin
  File.open(in_filename, 'r') do |file|
    text = file.read
    # Figure markup needs to go from the bottom to their in-line references.
    # From
    # [{#fig-id} Caption][Reference]
    # [Reference]: File.jpg {width=486 height=402}
    # To
    # ![Caption](File.png){#fig-ulysses1 width=486 height=402}
    f = 0 # of figures
    figures_data = text.scan(/^\[(.+?)\]: (.+?) \{(.+?)}$/) # Capture [caption]: fig.png
    figures = text.scan(/^!\[(.*?)\]\[(.+?)\]/) # Capture ![caption][reference]

    figures_data.each do |data|
      figures.each do |fig|
        next unless data[0] == fig[1]

        f += 1
        # ![caption][reference]
        search = "![#{fig[0]}][#{data[0]}]"
        # Capture figure id in the caption
        fig_id = fig[0][/#fig-.*?/] ? "#{fig[0].match(/#fig-(\w|-)+/)} " : ''
        fig_file = data[1].strip
        # Capture width in the caption
        width = fig[0][/width=([0-9]|\w|")+/] ? fig[0].match(/width=([0-9]|\w|")+/).to_s : ''
        # Capture height in the caption
        height = fig[0][/height=([0-9]|\w|")+/] ? fig[0].match(/height=([0-9]|\w|")+/).to_s : ''
        # If no width or height in the caption, use Scrivener's reference
        width_and_height = width.empty? && height.empty? ? data[2].to_s : "#{width} #{height}".strip
        # Caption text
        caption_text = fig[0].gsub(/\{.*?}/, '').strip

        # Replace text with the full reference
        text.gsub!(search, "![#{caption_text}](#{fig_file}){#{fig_id}#{width_and_height}}")
        # puts "----> Found figure: ![#{caption_text}](#{fig_file}){#{fig_id}#{width_and_height}}"
      end
      # Erase Scrivener references at end of file
      text.gsub!(/^\[(?<reference>.+?)\]: (?<url>.+?) ?\{(?<dimensions>.+?)}$\n*/, '')
    end
    puts "--> #{f} figures fixed." if f.positive?

    # Convert footnotes to pandoc style
    text = inline_fn_pandoc("#{text}\n\n")
    # Replace patterns
    rep_patterns.each do |pattern, replacement|
      text.gsub!(pattern, replacement)
    end
    # Extract and create files from pattern
    # <!-- begin_file: "path/to/file.ext" -->`file_content`<!-- end_file: "path/to/file.ext" -->\n
    if text =~ /<!-- begin_file: "([^"]+)" -->/ # If there are new files to be added
      # Array to store new files
      new_files = []
      # Get the new files
      text.scan(/<!-- begin_file: "([^"]+)" -->/) do |match|
        # puts "----> Found new file: #{match[0]}"
        new_files << match[0]
      end

      # Array to store created files for logging
      created_files = []
      new_files.each do |file|
        pattern = /<!-- begin_file: "#{file}" -->(.+?)<!-- end_file: "#{file}" -->/m
        # Get the file content
        file_content = text[pattern] ? text.scan(pattern)[0][0] : ''
        # Check if path exists, if not create it
        FileUtils.mkdir_p(File.dirname(file))
        # Write the file
        File.open(file, 'w') {|f| f.write(file_content)}
        # Add the file to the created files array
        created_files << file
        # `#{decrease_heading_cmd} "#{file}" -o "#{file}"` if file[/\.[q]?md$/]
        text.gsub!(pattern, '') unless file_content.nil? || file_content.empty?
      end
      puts "--> #{created_files.count} files created" if created_files.any?
    else
      puts '--> No new files detected!'
    end
    to_file.puts text.gsub(/\n{2,}/, "\n\n")
  end
  to_file.close
  FileUtils.mv(to_file.path, outo_filename)
ensure
  to_file.close
  to_file.delete
end

# Build and run our quarto command
cmd = if fileType.empty?
        "quarto render \"#{outo_filename}\""
      else
        "quarto render \"#{outo_filename}\" --to #{fileType}"
      end


unless dry_run
  begin
    pid = Process.spawn(cmd)
    Timeout.timeout(60) do
      puts "--> Running Command: #{cmd}" unless dry_run
      Process.wait(pid)
      puts 'Process finished in time'
    end
  rescue Timeout::Error
    puts 'Process not finished in time, killing it'
    Process.kill('TERM', pid)
    # open any log file (generated from scrivener's post-processing)
    `open Quarto.log` if File.file?('Quarto.log') && isRecent('Quarto.log')
  end
  fileType = 'html' if fileType.match(/revealjs|s5|slidous|html5/)
  res = outo_filename.gsub(/\.qmd$/, ".#{fileType}")
  if File.file?(res) && isRecent(res) && dry_run == false
    `open "#{res}"`
  else
    puts "There was some problem opening #{res}, check compiler log..."
  end
#  `open "#{outo_filename}"`
end

tend = Time.now - tstart
puts "--> Processing took: #{tend.to_s}s"

