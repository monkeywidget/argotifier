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

end
