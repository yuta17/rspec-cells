require 'rails/railtie'
module RSpec
  module Cells
    class Railtie < ::Rails::Railtie
      rake_tasks do
        load "rspec/cells/tasks.rake"
      end

      initializer 'cells.rspec' do |app|
        require 'rspec/cells'
      end
    end

    module Caching
      extend ActiveSupport::Concern

      module ClassMethods
        def enable_cell_caching!
          before :each do
            ActionController::Base.perform_caching = true
          end
          after :each do
            ActionController::Base.perform_caching = false
          end
        end

        def disable_cell_caching!
          before :each do
            ActionController::Base.perform_caching = false
          end
        end
      end
    end

  end
end
