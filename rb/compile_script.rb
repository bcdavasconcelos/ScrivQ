#!/usr/bin/env ruby
# encoding: utf-8

puts "TEste"
# Git init in current directory
p pwd = Dir.pwd
`git init .` unless File.directory?('.git')
#
