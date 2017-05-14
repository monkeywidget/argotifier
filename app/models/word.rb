# frozen_string_literal: true
class Word < ActiveRecord::Base
  has_many :sentences, through: :sentence_words
  validates :text, presence: true
  validates :text, length: { minimum: 1 }

  # scope :untranslated, -> {
  #     :joins      => "LEFT JOIN translated_words tw ON words.id = tw.word_id",
  #     :conditions => "tw.word_id IS NULL",
  #     :select     => "DISTINCT words.*"
  # }

  # scope :translated, -> {
  #     :joins      => "LEFT JOIN translated_words tw ON words.id = tw.word_id",
  #     :conditions => "tw.word_id IS NOT NULL",
  #     :select     => "DISTINCT words.*"
  # }

  # @return [String] the translation, or the original text if there is none
  def in_argot
    argot_word = TranslatedWord.find_by(word: self)
    argot_word.nil? ? text : argot_word.translation
  end

  # Render with a capitalization template
  # @param template [String] a template like one of {x,c,C}
  # @return [String] the rendered word
  def render(template)
    WordTemplate.new(template).render(text)
  end
end
