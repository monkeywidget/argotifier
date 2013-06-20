require 'spec_helper'

describe TranslatedWord do
  it "saves a basic translation mapping" do
    word = Word.find_or_create_by_text("foo")
    simple_trans = TranslatedWord.create!(translation: "bar", word: word)
    expect(simple_trans.translation).to eq("bar")
    expect(simple_trans.word.text).to eq("foo")
  end

  it "rejects null translation" do
    word = Word.find_or_create_by_text("foo")
    expect{TranslatedWord.create!(translation: "", word: word)}.to raise_error(ActiveRecord::RecordInvalid)
    expect{TranslatedWord.create!(word: word)}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "rejects null word" do
    expect{TranslatedWord.create!(translation: "foo", word: nil)}.to raise_error(ActiveRecord::RecordInvalid)
    expect{TranslatedWord.create!(translation: "foo")}.to raise_error(ActiveRecord::RecordInvalid)
  end

  #it "associates with an existing word" do
  #end

  #it "rejects association with nonexistent word" do
  # end

  #it "is uniquely associated with an existing word" do
  #end


end
