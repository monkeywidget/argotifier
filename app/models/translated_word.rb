class TranslatedWord < ActiveRecord::Base
  belongs_to :word
  validates :word, :presence => true
  validates :translation, :presence => true
  validates :translation, :length => { :minimum => 1 }

end
