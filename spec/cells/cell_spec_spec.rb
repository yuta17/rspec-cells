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

    context "as a test writer" do
      include CellExampleGroup

      it "should support _path helpers from the controller" do
        # We have to stub include so that things determine the route exists.
        Rails.application.routes.named_routes.helpers.stub(:include?).and_return(:true)
        @controller.should_receive(:test_path).at_least(:once)
        test_path
      end

      it "should support polymorphic_path from the controller" do
        # We have to stub include so that things determine the route exists.
        Rails.application.routes.named_routes.helpers.stub(:include?).and_return(:true)
        @controller.should_receive(:test_path).at_least(:once)
        polymorphic_path(:test)
      end

    end
  end
end
