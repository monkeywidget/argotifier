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

  # def in_argot
  #  TranslatedWord.find_by_word_id(self).translation || @text
  # end

  # @TODO move to concern?
  class << self
    # @param word [String] a word to categorize
    # @return [String] a template in [xcC]
    def to_template(word)
      return 'x' if word[0] !~ /[A-Z]/
      return 'C' if word =~ /^[A-Z][A-Z]+$/
      'c'
    end

    # @param word [String] the word to render
    # @param template [String] a template in [xcC]
    # @return [String] the rendered word
    def render_text_with_template(word, template)
      case template
        when 'x'
          word.downcase
        when 'c'
          word.capitalize
        when 'C'
          word.upcase
        else
          raise(ArgumentError, "template \'#{template}\' must be in [xcC] for \'#{word}\'")
      end
    end
  end

  # convert to a template
  # @param word [String] a word to categorize
  # @return [String] a template in [xcC]
  def as_template
    Word.to_template(text)
  end

  # Render with the template
  # @param template [String] a template in [xcC]
  # @return [String] the rendered word
  def rendered_with(template)
    Word.render_text_with_template(text, template)
  end
end
