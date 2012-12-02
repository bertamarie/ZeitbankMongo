require 'spec_helper'

describe "fans/show" do
  before(:each) do
    @fan = assign(:fan, stub_model(Fan))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
