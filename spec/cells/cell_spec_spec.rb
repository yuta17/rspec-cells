require 'spec_helper'
require 'cells'

class DummyCell < Cell::Base
  def show
    "<p>I'm Dummy.</p>"
  end

  def update(what)
    "Updating #{what}."
  end
end

class SongCell < Cell::ViewModel
  def show
    "#{model}!"
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
      expect(group.metadata[:type]).to eq(:cell)
    end

    describe "#render_cell" do
      it "renders a state" do
        expect(group.new.render_cell(:dummy, :show)).to eq("<p>I'm Dummy.</p>")
      end

      it "allows passing state args" do
        expect(group.new.render_cell(:dummy, :update, "this")).to eq('Updating this.')
      end

      # view model
      # call state
      it "allows rendering view model" do
        expect(group.new.cell(:song, "Hangover").show).to eq("Hangover!")
      end

      # stubbing #cell
      it do
        cell = group.new.cell(:song, "Hangover")
        cell.stub(:model => "Swarming Goblets")
        expect(cell.show.native.to_s).to eq("Swarming Goblets!")
      end
    end

    it "responds to #cell" do
      expect(group.new.cell(:dummy)).to be_kind_of(DummyCell)
    end

    # FIXME: could anyone make capybara/rails work in these tests?
    # it "allows using matchers with #render_state" do
    #   expect(cell(:dummy).render_state(:show)).to have_selector("p")
    # end

    context "as a test writer" do
      include CellExampleGroup

      it "should support _path helpers from the controller" do
        # We have to stub include so that things determine the route exists.
        allow(Rails.application.routes.named_routes.helpers).to receive(:include?).and_return(true)
        expect(@controller).to receive(:test_path).at_least(:once)
        test_path
      end

      it "should support polymorphic_path from the controller" do
        # We have to stub include so that things determine the route exists.
        allow(Rails.application.routes.named_routes.helpers).to receive(:include?).and_return(true)
        expect(@controller).to receive(:test_path).at_least(:once)
        polymorphic_path(:test)
      end

    end
  end
end
