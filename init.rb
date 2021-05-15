#!/usr/bin/env ruby

require_relative 'lib/controller'

APP_ROOT = File.expand_path(File.dirname(__FILE__))

controller = BigFiveResults::Controller.new

controller.run!
