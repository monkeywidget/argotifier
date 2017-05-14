class TranslatedWord < ActiveRecord::Base
  belongs_to :word
  validates :word, presence: true, allow_nil: false, on: :create
  validates_associated :word
  validates :word_id, presence: true, uniqueness: true

  validates :translation, presence: true
  validates :translation, length: { :minimum => 1 }
end
