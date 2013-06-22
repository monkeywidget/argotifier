class TranslatedWord < ActiveRecord::Base
  belongs_to :word
  validates :word, :presence => true
  validates_uniqueness_of :word_id

  validates :translation, :presence => true
  validates :translation, :length => { :minimum => 1 }

end
