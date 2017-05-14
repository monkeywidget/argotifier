# frozen_string_literal: true
class Document < ActiveRecord::Base
  has_many :paragraphs #, :order => 'paragraphs.document_index'
end
