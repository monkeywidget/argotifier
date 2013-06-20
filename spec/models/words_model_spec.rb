require 'spec_helper'

describe Word do
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
