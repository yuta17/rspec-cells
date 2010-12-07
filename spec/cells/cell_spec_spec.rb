require 'rubygems'

# wycats says...
require 'bundler'
Bundler.setup

$:.unshift File.dirname(__FILE__) # add current dir to LOAD_PATHS
require "rails/all"
require '../../lib/rspec-cells'

module RSpecCells
  class Application < ::Rails::Application
  end
end

module RSpec::Rails
  describe CellExampleGroup do
    #it { should be_included_in_files_in('./spec/controllers/') }
    #it { should be_included_in_files_in('.\\spec\\controllers\\') }

    let(:group) do
      RSpec::Core::ExampleGroup.describe do
        include CellExampleGroup
      end
    end

    it "includes routing matchers" do
      group.should respond_to(:render_cell)
    end
  end
end
