# frozen_string_literal: true
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :translated_word do
    translation "MyString"
    word nil
  end
end
