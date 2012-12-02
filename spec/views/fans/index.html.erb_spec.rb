require 'spec_helper'

describe "fans/index" do
  before(:each) do
    assign(:fans, [
      stub_model(Fan),
      stub_model(Fan)
    ])
  end

  it "renders a list of fans" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
