require 'spec_helper'

describe "messages/index" do
  before(:each) do
    assign(:messages, [
      stub_model(Message,
        :subject => "Subject",
        :content => "MyText",
        :recipient => "Recipient",
        :sender => "Sender"
      ),
      stub_model(Message,
        :subject => "Subject",
        :content => "MyText",
        :recipient => "Recipient",
        :sender => "Sender"
      )
    ])
  end

  it "renders a list of messages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Recipient".to_s, :count => 2
    assert_select "tr>td", :text => "Sender".to_s, :count => 2
  end
end
