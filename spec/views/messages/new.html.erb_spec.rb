require 'spec_helper'

describe "messages/new" do
  before(:each) do
    assign(:message, stub_model(Message,
      :subject => "MyString",
      :content => "MyText",
      :recipient => "MyString",
      :sender => "MyString"
    ).as_new_record)
  end

  it "renders new message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => messages_path, :method => "post" do
      assert_select "input#message_subject", :name => "message[subject]"
      assert_select "textarea#message_content", :name => "message[content]"
      assert_select "input#message_recipient", :name => "message[recipient]"
      assert_select "input#message_sender", :name => "message[sender]"
    end
  end
end
