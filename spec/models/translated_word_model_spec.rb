# frozen_string_literal: true
# require 'spec_helper'
#
# describe TranslatedWord do
#   it "saves a basic translation mapping" do
#     @foo_word = FactoryGirl.create(:word, text: "foo", id: "1")
#     simple_trans = TranslatedWord.create!(translation: "bar", word: @foo_word)
#     expect(simple_trans.translation).to eq("bar")
#     expect(simple_trans.word.text).to eq("foo")
#   end
#
#   it "rejects null translation" do
#     @foo_word = FactoryGirl.create(:word, text: "foo", id: "1")
#     expect{TranslatedWord.create!(translation: "", word: @foo_word)}.to raise_error(ActiveRecord::RecordInvalid)
#     expect{TranslatedWord.create!(word: @foo_word)}.to raise_error(ActiveRecord::RecordInvalid)
#   end
#
#   it "rejects null word" do
#     expect{TranslatedWord.create!(translation: "foo", word: nil)}.to raise_error(ActiveRecord::RecordInvalid)
#     expect{TranslatedWord.create!(translation: "foo")}.to raise_error(ActiveRecord::RecordInvalid)
#   end
#
#   it "is uniquely associated with an existing word" do
#     @foo_word = FactoryGirl.create(:word, text: "foo", id: "1")
#     TranslatedWord.create!(translation: "bar", word: @foo_word)
#     expect{TranslatedWord.create!(translation: "garply", word: @foo_word)}.to raise_error(ActiveRecord::RecordInvalid)
#   end
#
#
# end
