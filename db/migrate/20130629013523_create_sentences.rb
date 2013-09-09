class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.string :word_template
      t.integer :paragraph_index
      t.belongs_to :paragraph
      t.timestamps
    end

    create_table :sentences_words, :id => false do |t|
      t.integer :sentence_id, :null => false
      t.integer :word_id, :null => false
      t.integer :sentence_index
    end

    add_index :sentences_words, [:sentence_id, :word_id]

  end
end
