# these requires are entirely for add_new_paragraph
# require 'paragraph'
# require 'sentence'
# require 'word'
# require 'sentenceword'

class Document < ActiveRecord::Base

  has_many :paragraphs, :order => 'paragraphs.document_index'

  def add_new_paragraph( paragraph_text )

    next_paragraph_index = paragraphs.length
      # the collection is 0-indexed,
      # and therefore the new last one will have an index that is the current length

    paragraph = Paragraph.create!(:document => self,
                                  :document_index => next_paragraph_index)
    paragraph.tokenize(paragraph_text)
    paragraph.save

    paragraphs << paragraph    # adds to the end of the collection

  end

end
