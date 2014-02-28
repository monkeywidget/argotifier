# these requires are entirely for add_new_paragraph
require 'paragraph'
require 'sentence'
require 'word'
require 'sentenceword'

class Document < ActiveRecord::Base

  has_many :paragraphs, :order => 'paragraphs.document_index'

  def add_new_paragraph( paragraph_text )

    # 0-indexed
    next_paragraph_index = paragraphs.length

    paragraph = Paragraph.create!(:document => self,
                                  :document_index => next_paragraph_index)
    paragraph.tokenize(paragraph_text)
  end

end
