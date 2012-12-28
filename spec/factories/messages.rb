# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    subject "MyString"
    content "MyText"
    recipient "MyString"
    sender "MyString"
  end
end
