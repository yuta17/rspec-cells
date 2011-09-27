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
      # Why is this weird? See https://github.com/rspec/rspec-core/issues/460
      group.new.__should_for_example_group__ respond_to(:render_cell)
    end
  end
end
