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
  # 
  # describe "#in_argot" do
  #   before do
  #     @word_foo_1 = FactoryGirl.create(:word, text: "foo", id: "1")
  #     @word_foo_2 = FactoryGirl.create(:word, text: "baz", id: "2")
  #     @translated_word_foo_bar_1 = FactoryGirl.create(:translated_word,
  #                                                     translation: "bar", word: @word_foo_1,
  #                                                     id: "1")
  #   end
  #
  #
  #   it "prints equivalent argot if there is a matching TranslatedWord" do
  #     expect(@word_foo_1.in_argot).to eq("bar")
  #   end
  #
  #   it "prints itself if there is no matching TranslatedWord" do
  #     expect(@word_foo_2.in_argot).to eq("baz")
  #   end
  # end
  #
  # describe "#as_template" do
  #
  #   it "converts a all-lowercased word to 'x'" do
  #     @word_foo_1 = FactoryGirl.create(:word, text: "fOo", id: "1")
  #     expect(@word_foo_1.as_template).to eq('x')
  #   end
  #
  #   it "converts an initially-uppercased word to 'c'" do
  #     @word_foo_1 = FactoryGirl.create(:word, text: "Foo", id: "1")
  #     expect(@word_foo_1.as_template).to eq('c')
  #   end
  #
  #   it "converts a all-uppercased word to 'C'" do
  #     @word_foo_1 = FactoryGirl.create(:word, text: "FOO", id: "1")
  #     expect(@word_foo_1.as_template).to eq('C')
  #   end
  #
  #   it "converts a mixed-cased, non-initially capitalized word to 'x'" do
  #     @word_foo_1 = FactoryGirl.create(:word, text: "foo", id: "1")
  #     expect(@word_foo_1.as_template).to eq('x')
  #   end
  #
  #   it "converts any hyphenated word, regardless of case, to 'x'" do
  #     @word_foo_1 = FactoryGirl.create(:word, text: "foo-bar", id: "1")
  #     @word_foo_2 = FactoryGirl.create(:word, text: "Foo-bar", id: "2")
  #     @word_foo_3 = FactoryGirl.create(:word, text: "Foo-Bar", id: "3")
  #
  #     expect(@word_foo_1.as_template).to eq('x')
  #     expect(@word_foo_2.as_template).to eq('x')
  #     expect(@word_foo_3.as_template).to eq('x')
  #   end
  #
  #
  # end
  #
  # describe "#rendered_with" do
  #   before do
  #     @word_foo_1 = FactoryGirl.create(:word, text: "fOo", id: "1")
  #   end
  #
  #   it "rejects a call with an invalid template option" do
  #     expect{@word_foo_1.rendered_with('A')}.to raise_error(ArgumentError)
  #   end
  #
  #   it "renders word with 'x' as all-lowercase" do
  #     expect(@word_foo_1.rendered_with('x')).to eq("foo")
  #   end
  #
  #   it "renders word with 'c' as initially-uppercased" do
  #     expect(@word_foo_1.rendered_with('c')).to eq("Foo")
  #   end
  #
  #   it "renders word with 'C' as all-uppercased" do
  #     expect(@word_foo_1.rendered_with('C')).to eq("FOO")
  #   end
  # end


end
