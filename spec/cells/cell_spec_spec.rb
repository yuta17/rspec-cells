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
    let(:group) do
      RSpec::Core::ExampleGroup.describe do
        include CellExampleGroup
      end
    end
    
    it "adds :type => :cell to the metadata" do
      group.metadata[:type].should eq(:cell)
    end
    
    it "responds to #render_cell" do
      group.new.should respond_to(:render_cell)
    end
  end
end
