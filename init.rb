#!/usr/bin/env ruby

require 'optparse'
require_relative 'lib/controller'

options = {}

OptionParser.new do |opts|
  opts.banner = "Usage: your_app [options]"

  opts.on('-f [ARG]', '--textfile [ARG]', "Specify the textfile") do |v|
    hash_options[:textfile] = v
  end

  opts.on('-u [ARG]', '--results_url [ARG]', "Specify the results_url") do |v|
    options[:results_url] = v
  end

  opts.on('-n [ARG]', '--name [ARG]', "Specify the name") do |v|
    options[:name] = v
  end

  opts.on('-e [ARG]', '--email [ARG]', "Specify the email") do |v|
    options[:email] = v
  end

  opts.on('-h', '--help', 'Display this help') do 
    puts opts
    exit
  end
end.parse!


APP_ROOT = File.expand_path(File.dirname(__FILE__))

use_url = ENV["USE_URL"] && ENV["USE_URL"] ? true : false

controller = BigFiveResults::Controller.new(options: options, use_url: use_url)

controller.run!
