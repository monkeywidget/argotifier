# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sentence do
    word_template "MyString"
    paragraph_index 1
  end
end
