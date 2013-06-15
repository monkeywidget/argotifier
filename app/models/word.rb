class Word < ActiveRecord::Base
  validates :text, :presence => true
  validates :text, :length => { :minimum => 1 }
end
