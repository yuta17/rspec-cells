require 'rubygems' unless defined?(Gem)
require 'bundler/setup'

require 'rails'
require 'action_controller/railtie'
require 'action_view/railtie'
require 'rspec-cells'
require 'rspec/rails'
require 'cells'
require 'rspec/cells'

module RSpecCells
  class Application < ::Rails::Application
    config.secret_token = 'x'*30
  end
end


# require 'capybara/rspec'