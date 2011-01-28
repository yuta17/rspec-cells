require 'spec_helper'

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
