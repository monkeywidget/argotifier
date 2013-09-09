require 'spec_helper'

describe Sentence do

  describe "#create" do

    before do
      @paragraph = FactoryGirl.create(:paragraph)
    end

    it "creates with a paragraph" do
      sentence = Sentence.create!(paragraph: @paragraph, paragraph_index: 1)
    end

    it "saves a template" do
      sentence = Sentence.create!(paragraph: @paragraph, paragraph_index: 1)
      sentence.tokenize("The QUICK brown Fox jumps over the lazy-dogs!")
      expect(sentence.word_template).to eq("c C x c x x x x!")
    end

    it "requires an existing paragraph"
    it "requires a paragraph order parameter"
    it "requires rejects a paragraph order parameter duplicating another sentence"

  end

  describe "#tokenize" do
    it "rejects invalid text"

    it "creates Word objects" do
      expect(Word.count).to eq(0)

      sentence = Sentence.create!(paragraph: @paragraph, paragraph_index: 1)
      sentence.tokenize("The QUICK brown Fox jumps over the lazy-dogs!")

      expect(Word.count).to eq(7)   # remember not to count "the" more than once
    end

    describe "with a previously existing Word" do
      before do
        expect(Word.count).to eq(0)
        @word_the = FactoryGirl.create(:word, text: "the", id: "1")
        expect(Word.count).to eq(1)
      end

      it "does not create duplicate Words" do

        sentence = Sentence.create!(paragraph: @paragraph, paragraph_index: 1)
        sentence.tokenize("The QUICK brown Fox jumps over the lazy-dogs!")

        expect(Word.count).to eq(7)   # remember not to count "the" more than once
      end

      it "creates Word objects without case" do

        sentence = Sentence.create!(paragraph: @paragraph, paragraph_index: 1)
        sentence.tokenize("The QUICK brown Fox jumps over the lazy-dogs!")

        expect(Word.find_by_text("the")).to eq(@word_the)
        expect(sentence.words[0]).to eq(@word_the)
        expect(sentence.words[6]).to eq(@word_the)
      end
    end

    it "records Word capitalizations for each case"

    it "adds to the parent paragraph"

  end


  describe "#render" do

    describe "untranslated Words" do
    it "returns text of component Words"
    it "returns text of component Words in order"
    it "returns text of component Words capitalized properly"
    it "returns text of component Words with original punctuation"
    end

    describe "translated Words" do
    it "returns text of component Words in argot"
    it "returns text of component Words in order in argot"
    it "returns text of component Words capitalized properly in argot"
    it "returns text of component Words with original punctuation in argot"
    end
  end


end