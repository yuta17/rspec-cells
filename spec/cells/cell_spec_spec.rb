require 'spec_helper'
require 'cells'

class DummyCell < Cell::Base
  def show
    "I'm Dummy."
  end
  
  def update(what)
    "Updating #{what}."
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
    
    describe "#render_cell" do
      it "renders a state" do
        group.new.render_cell(:dummy, :show).should == "I'm Dummy."
      end
      
      it "allows passing state args" do
        group.new.render_cell(:dummy, :update, "this").should == "Updating this."
      end
    end
    
    it "responds to #cell" do
      group.new.cell(:dummy).should be_kind_of(DummyCell)
    end
  end
end
