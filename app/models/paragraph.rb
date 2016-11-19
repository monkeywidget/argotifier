# frozen_string_literal: true
class Paragraph < ActiveRecord::Base
  belongs_to :document
  validates_presence_of :document, :document_index
  validates_uniqueness_of :document_index, scope: [:document_id]
  has_many :sentences #, :order => 'sentences.paragraph_index'

  # intended usage: in Document
  # Paragraph.parse_and_create(text_here, this)
  class << self
    # - create a new Paragraph record from the given original text
    # - add it to the Document provided
    def parse_and_create(paragraph_text, parent_document)
      Paragraph.create!(document: parent_document,
                        document_index: parent_document.sentences.count).set_text(paragraph_text)
    end
  end

  # tokenizes every sentence
  # @param [String] paragraph_text the text, with punctuation, of the original paragraph
  def set_text(paragraph_text)
    raise ArgumentError.new("Tried to tokenize invalid text for Paragraph #{id}") if paragraph_text.nil? || paragraph_text.empty?
    tokenize(paragraph_text)
    save
  end

  # given a block of text, no carriage returns, break into sentences.
  # we want to split on  . ! ?  (not  or !" ?" which comes before .
  #                             - also disclude variants with ' )
  #  basically:   \?(?!('|"))|\.|!(?!('|"))
  # calls Sentence.parse_and_create(sentence_text, self)
  def tokenize(text)
    puts 'bleh'
  end
  
end
