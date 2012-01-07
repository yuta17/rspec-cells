require 'rubygems' unless defined?(Gem)
require 'bundler/setup'

#$:.unshift File.dirname(__FILE__) # add current dir to LOAD_PATHS
require "rails/all"
require 'rspec-cells'
require 'rspec/rails'
require 'cell/test_case'
require 'rspec/rails/example/cell_example_group'

module RSpecCells
  class Application < ::Rails::Application
  end
end
