require 'spec_helper'

describe "fans/new" do
  before(:each) do
    assign(:fan, stub_model(Fan).as_new_record)
  end

  it "renders new fan form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => fans_path, :method => "post" do
    end
  end
end
