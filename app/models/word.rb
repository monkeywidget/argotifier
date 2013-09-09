class Word < ActiveRecord::Base
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

  def rendered_with (template)
    case template
      when 'x'
        text.downcase
      when 'c'
        text.capitalize
      when 'C'
        text.upcase
      else
        raise(ArgumentError, ":template must be one of [xcC]")
    end
  end

end
