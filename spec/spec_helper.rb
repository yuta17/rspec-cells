require 'rubygems' unless defined?(Gem)
require 'bundler/setup'

#$:.unshift File.dirname(__FILE__) # add current dir to LOAD_PATHS
require 'rails'
require 'action_controller/railtie'
require 'action_view/railtie'
require 'rspec-cells'
require 'rspec/rails'
require 'cell/base'
require 'rspec/cells'

module RSpecCells
  class Application < ::Rails::Application
  end
end
