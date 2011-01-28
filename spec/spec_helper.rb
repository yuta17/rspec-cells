require 'rubygems'

# wycats says...
require 'bundler'
Bundler.setup

#$:.unshift File.dirname(__FILE__) # add current dir to LOAD_PATHS
require "rails/all"
require 'rspec-cells'

module RSpecCells
  class Application < ::Rails::Application
  end
end
