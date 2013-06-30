require 'spec_helper'

describe Word do

  describe "#create" do
    it "saves basic text" do
      simple_word = Word.create!(text: "foo")
      expect(simple_word.text).to eq("foo")
    end

    it "rejects null text" do
      expect{Word.create!(text: "")}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "rejects no create args" do
      expect{Word.create!()}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "does not create words with duplicate text" do
      first_word = Word.create!(text: "foo")
      expect(Word.count()).to eq(1)
      expect(Word.find_or_create_by_text("foo")).to eq(first_word)
      expect(Word.count()).to eq(1)
      # expect(Word.find_or_create_by_text("bar")).to_not eq(first_word)
    end

    it "creates words with nonmatching find/create" do
      first_word = Word.create!(text: "foo")
      expect(Word.count()).to eq(1)
      expect(Word.find_or_create_by_text("bar")).to_not eq(first_word)
      expect(Word.count()).to eq(2)
    end
  end

  describe "#in_argot" do
    before do
      @word_foo_1 = FactoryGirl.create(:word, text: "foo", id: "1")
      @word_foo_2 = FactoryGirl.create(:word, text: "baz", id: "2")
      @translated_word_foo_bar_1 = FactoryGirl.create(:translated_word,
                                                      translation: "bar", word: @word_foo_1,
                                                      id: "1")

    end


    it "prints equivalent argot if there is a matching TranslatedWord" do
      expect(@word_foo_1.in_argot).to eq("bar")
    end

    it "prints itself if there is no matching TranslatedWord" do
      expect(@word_foo_2.in_argot).to eq("baz")
    end
  end

end
