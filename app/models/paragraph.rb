class Paragraph < ActiveRecord::Base
  has_many :sentences, :order => 'sentences.paragraph_index'


  def original
    original_sentences = []

    sentences.each do |sentence|
      original_sentences << sentence.original
    end

    original_sentences.join(" ")
  end


  def translation
    translated_sentences = []

    sentences.each do |sentence|
      translated_sentences << sentence.translation
    end

    translated_sentences.join(" ")
  end

end
