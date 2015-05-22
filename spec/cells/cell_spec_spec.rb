require 'spec_helper'

class DummyCell < Cell::ViewModel
  def show
    "<p>I'm Dummy.</p>"
  end

  def update
    "Updating #{options[:what]}."
  end
end

class SongCell < Cell::ViewModel
  def show
    "#{model}!"
  end
end

describe "Cell::Testing in specs" do
  include RSpec::Cells::ExampleGroup

  describe "#cell" do
    it { expect(cell(:dummy).call).to eq("<p>I'm Dummy.</p>") }

    # with user options.
    it { expect(cell(:song, "Don't Have The Cow").call).to eq("Don't Have The Cow!") }
  end

  describe "Capybara matchers" do

    it { skip "please make Capybara run with the test suite"; expect(cell(:dummy).call).to have_selector("p") }
  end
end
