class Paragraph < ActiveRecord::Base
  has_many :sentences, :order => 'sentences.paragraph_index'

end
