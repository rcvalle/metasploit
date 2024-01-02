#!/usr/bin/env ruby
# By Ramon de C Valle. This work is dedicated to the public domain.

require "msfenv"
require "msf/base"
require "optparse"
require "time"
require "yaml"

Version = [0, 0, 1]
Release = nil

options = {}
OptionParser.new do |parser|
  parser.banner = "Usage: #{parser.program_name} [options]"

  parser.separator("")
  parser.separator("Options:")

  parser.on("--author AUTHOR", "Specify the module author") do |author|
    options[:author] = Regexp.new(author)
  end

  parser.on("-h", "--help", "Show this message") do
    puts parser
    exit
  end

  parser.on("-o", "--output FILE", "Output file") do |file|
    options[:file] = File.new(file, "w+b")
  end

  parser.on("--types x,y,z", Array, "Specify the module types") do |types|
    options[:types] = types
  end

  parser.on("-v", "--verbose", "Verbose mode") do |v|
    options[:verbose] = v
  end

  parser.on("--version", "Show version") do
    puts parser.ver
    exit
  end
end.parse!

author = options[:author] || nil
file = options[:file] || nil
types = options[:types] || nil
verbose = options[:verbose] || false

modules = []
opts = {"DisableDatabase" => true, :module_types => [types].flatten!}
framework = Msf::Simple::Framework.create(opts)
framework.modules.each do |_, m|
  next if m.nil?
  m = m.new
  authors = m.author.map(&:to_s)
  next unless author.nil? || authors.grep(author).any?
  date = `git log --author="#{Regexp.escape(author.source)}" --format=%ai "#{m.file_path}" | tail -n 1`.strip
  next if date.empty?
  mod = {}
  mod["description"] = m.description.tr("\n", " ").gsub(/\s+/, " ").strip
  mod["name"] = m.fullname
  mod["published"] = Time.parse(date).utc
  mod["updated"] = Time.parse(`git log --format=%ai "#{m.file_path}" | head -n 1`.strip).utc
  mod["vulnerabilities"] = []
  m.references.each { |reference| mod["vulnerabilities"] << "#{reference.ctx_id}-#{reference.ctx_val}" if reference.ctx_id == "CVE" }
  modules << mod
end

modules.sort_by! { |m| m["published"] }
modules.reverse!
if file
  file.write(modules.to_yaml)
  file.close
else
  puts modules.to_yaml
end
