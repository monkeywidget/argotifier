require 'spec_helper'

describe Paragraph do


  describe "#create" do


    it "creates ..." do
      sentence = Paragraph.create!
    end

    it "creates with a document"

    it "creates with a sequence in the document"

  end

  describe "#tokenize" do
    it "creates Sentences"

    it "adds created Sentences to self"

    it "maintains Sentence order"
  end


  describe "renderers" do
    before do

    end
    describe "#original" do

      it "renders Sentences in order"

      describe "with translations" do
        it "renders Sentences without TranslatedWords"
      end

      describe "with no translations" do
        it "renders Sentences without TranslatedWords"
      end

    end


    describe "#translation" do
      it "renders Sentences in order"

      describe "with translations" do
        it "renders Sentences with TranslatedWords"
      end

      describe "with no translations" do
        it "renders Sentences without TranslatedWords"
      end
    end
  end

end
