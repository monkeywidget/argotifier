require 'spec_helper'

describe Paragraph do

  before do
    @sample_paragraph_text = "\"Beware the Jabberwock, my son!
      The jaws that bite, the claws that catch!
      Beware the Jubjub bird, and shun
      The frumious Bandersnatch!\""
  end

  describe "#create" do


    it "creates ..." do
      sentence = Paragraph.create!
    end

    it "creates with a document and a sequence in the document"

    it "creates rejects a missing document"
    it "creates rejects a nonexistent document"
    it "creates rejects a missing sequence in the document"
    it "creates rejects a nonexistent in the document"

  end

  # note: this is the topmost tokenize-
  #   there is no Document#tokenize
  describe "#tokenize" do

    before do
      @paragraph = Paragraph.create!()
      expect(@paragraph.sentences.count).to eq(0)
    end

    # catch basic errors in tokenize
    it "tokenizes words" do
      @paragraph.tokenize(@sample_paragraph_text)
      expect(Paragraph.exists?(@paragraph)).to eq(true)
    end


    describe "after tokenizing" do

      before do
        @paragraph.tokenize(@sample_paragraph_text)
      end

      it "adds created Sentences to self" do
        expect(@paragraph.sentences.count).to eq(3)
        expect(Sentence.exists?(@paragraph.sentences.first)).to eq(true)
      end

      it "maintains Sentence order" do

        @paragraph.sentences.each do |sentence|
          puts "DEBUG: sentences: %s" % sentence.to_s
        end

        expect(@paragraph.sentences.first.original).to eq("\"Beware the Jabberwock, my son!")
#        expect(@paragraph.sentences[2].original).to eq("Beware the Jubjub bird, and shun
#      The frumious Bandersnatch!\"")
      end

    end

  end # tokenize

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
