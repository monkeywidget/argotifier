class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.string :word_template
      t.integer :paragraph_index
      t.references :paragraphs, :null => false
      t.timestamps
    end

    create_table :sentences_words, :id => false do |t|
      t.references :sentences, :null => false
      t.references :words, :null => false
      t.integer :sentence_index
    end

  end
end
