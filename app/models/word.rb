class Word < ActiveRecord::Base
  has_many :sentences, :through => :sentence_words
  validates :text, :presence => true
  validates :text, :length => { :minimum => 1 }

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

  def self.render_word_with_template ( sample_text, template )
    case template
      when 'x'
        sample_text.downcase
      when 'c'
        sample_text.capitalize
      when 'C'
        sample_text.upcase
      else
        raise(ArgumentError, ":template must be one of [xcC]")
    end
  end

  def rendered_with (template)
    Word.render_word_with_template(text, template)
  end

end
