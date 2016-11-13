# frozen_string_literal: true
class Paragraph < ActiveRecord::Base
  belongs_to :document
  validates_presence_of :document, :document_index
  validates_uniqueness_of :document_index, scope: [:document_id]
  has_many :sentences #, :order => 'sentences.paragraph_index'
end
