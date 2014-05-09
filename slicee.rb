#!/usr/bin/env ruby
require 'optparse'
require './slicee.lib.rb'

version = '0.0.1'
options = {}

OptionParser.new do |opts|
  opts.banner = "Usage slicee.rb [options] <source file> <target path>"
  
  opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
    options[:verbose] = v
  end
  
  opts.on("-d", "--[no-]debug", "Run and print debug info") do |v|
    options[:debug] = v
  end

  opts.on("-l", "--only-layers", "Only export layers") do |v|
    options[:only_layers] = v
  end

  opts.on("-g", "--only-groups", "Only export groups") do |v|
    options[:only_groups] = v
  end

  opts.on("-v", "--version", "Show version") do 
    puts version
    exit
  end
end.parse!

Slicee.verbose(options[:verbose])
Slicee.debug(options[:debug])

# Process arguments
if ARGV.length == 0
  puts 'no source file'
  exit
end

if ARGV.length == 1
  ARGV[1] = './'
end

if options[:only_layers]
  Slicee.slicy_only_layers(ARGV[0], ARGV[1])
elsif options[:only_groups]
  Slicee.slicy_only_groups(ARGV[0], ARGV[1])
else 
  Slicee.slicy(ARGV[0], ARGV[1])
end       


