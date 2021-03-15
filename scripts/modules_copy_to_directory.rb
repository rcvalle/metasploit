#!/usr/bin/env ruby
# Copyright 2018 Ramon de C Valle
# SPDX-License-Identifier: 0BSD

require 'msfenv'
require 'msf/base'
require 'optparse'

Version = [0, 0, 1]
Release = nil

options = {}

OptionParser.new do |parser|
  parser.banner = "Usage: #{parser.program_name} [options]"

  parser.separator('')
  parser.separator('Options:')

  parser.on('--author AUTHOR', 'Specify the module author') do |author|
    options[:author] = Regexp.new(author)
  end

  parser.on('-h', '--help', 'Show this message') do
    puts parser
    exit
  end

  parser.on('-o', '--output DIR', 'Output directory') do |dir|
    options[:dir] = dir
  end

  parser.on('--types x,y,z', Array, 'Specify the module types') do |types|
    options[:types] = types
  end

  parser.on('-v', '--verbose', 'Verbose mode') do |v|
    options[:verbose] = v
  end

  parser.on('--version', 'Show version') do
    puts parser.ver
    exit
  end
end.parse!

author = options[:author] || nil
dir = options[:dir] || '.'
types = options[:types] || nil
verbose = options[:verbose] || false

opts = { 'DisableDatabase' => true, module_types: [types].flatten! }
framework = Msf::Simple::Framework.create(opts)
framework.modules.each do |_, m|
  next if m.nil?
  m = m.new
  authors = m.author.map(&:to_s)
  next unless author.nil? || authors.grep(author).any?
  date = `git log --author="#{Regexp.escape(author.source)}" --format=%ai "#{m.file_path}" | tail -n 1`.strip
  next if date.empty?
  dest = File.dirname(m.file_path).sub(/^.*\/modules/, dir)
  FileUtils.mkdir_p(dest, verbose: verbose)
  FileUtils.cp(m.file_path, dest, verbose: verbose)
end
