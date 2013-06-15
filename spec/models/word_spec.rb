require 'spec_helper'

describe Word do
  it "saves basic text" do
    simple_word = Word.create!(text: "foo")
    expect(simple_word.text).to eq("foo")
  end

  it "rejects null text" do
    expect{Word.create!(text: "")}.to raise_error(ArgumentError)
  end

end
