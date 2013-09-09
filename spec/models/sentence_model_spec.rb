require 'spec_helper'

describe Sentence do

  describe "#create" do

    before do
      @paragraph = FactoryGirl.create(:paragraph, id: "1")
    end

    it "saves a template" do
      sentence = Sentence.create!(@paragraph, paragraph_index: 1)
      sentence.tokenize("The QUICK brown Fox jumps over the lazy-dogs!")
      expect(sentence.word_template).to eq("c C x c x x x x!")
    end

    it "requires an existing paragraph"
    it "requires a paragraph order parameter"
    it "requires rejects a paragraph order parameter duplicating another sentence"


    it "rejects invalid text"
    it "creates Word objects"
    it "does not create duplicate Words"
    it "does not create duplicate Words originally with differing capitalization"
    it "creates Word objects without case"
    it "records Word capitalizations for each case"


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