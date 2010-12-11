require 'rspec/rails'
require 'cell/test_case'
require 'rspec/rails/example/cell_example_group'

module RSpec
  module Cells
    class Railtie < ::Rails::Railtie
      rake_tasks do
        load "rspec/cells/tasks.rake"
      end
    end
  end
end
