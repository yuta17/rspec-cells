begin
  require 'rails/railtie'
rescue LoadError
else
  module Cells
    module RSpec
      class Railtie < ::Rails::Railtie
        initializer 'cells.rspec' do |app|
          require 'rspec/cells'
        end
      end
    end
  end
end
