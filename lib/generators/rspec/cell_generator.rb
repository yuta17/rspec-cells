require 'generators/cells/base'

module Rspec
  module Generators
    class CellGenerator < ::Cells::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def create_cell_spec_file
        template "cell_spec.erb", File.join("spec/cells/#{file_name}_cell_spec.rb")
      end
    end
  end
end
