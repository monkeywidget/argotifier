# require 'sentenceword.rb'
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sentence do
    word_template "MyString"
    paragraph_index 1
  end
end


# the SentenceWord class is a little nonstandard, so we have to explicitly define it
FactoryGirl.define do
  factory :sentenceword, class: SentenceWord do
    sentence_index 1
  end
end
