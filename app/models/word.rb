class Word < ActiveRecord::Base
  has_many :sentences, :through => :sentence_words
  validates :text, :presence => true
  validates :text, :length => { :minimum => 1 }

  scope :untranslated, -> {
      where active: true,
      :joins      => "LEFT JOIN translated_words tw ON words.id = tw.word_id",
      :conditions => "tw.word_id IS NULL",
      :select     => "DISTINCT words.*"
  }

  scope :translated, -> {
      where active: true,
      :joins      => "LEFT JOIN translated_words tw ON words.id = tw.word_id",
      :conditions => "tw.word_id IS NOT NULL",
      :select     => "DISTINCT words.*"
  }

  def in_argot
    translation = TranslatedWord.find_by_word_id(self)

    if translation.nil?
      self.text
    else
      translation.translation
    end
  end

  def self.to_template(original_text)
    if original_text =~ /^[A-Z][A-Z]+$/
      "C"
    elsif original_text =~ /^[A-Z][a-z]+$/
      "c"
    else
      "x"
    end
  end

  def as_template
    Word.to_template(text)
  end

  def self.render_text_with_template ( sample_word, template )
    case template
      when 'x'
        sample_word.downcase
      when 'c'
        sample_word.capitalize
      when 'C'
        sample_word.upcase
      else
        raise(ArgumentError, ":template must be one of [xcC]")
    end
  end

  def rendered_with (template)
    Word.render_text_with_template(text, template)
  end

end
