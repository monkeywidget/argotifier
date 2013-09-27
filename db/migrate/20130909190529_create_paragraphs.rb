class CreateParagraphs < ActiveRecord::Migration
  def change
    create_table :paragraphs do |t|
      t.timestamps
      t.integer :document_index
      t.belongs_to :document
    end
  end
end
