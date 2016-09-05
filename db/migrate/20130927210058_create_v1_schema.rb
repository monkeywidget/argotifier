# frozen_string_literal: true
class CreateV1Schema < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :text

      t.timestamps
    end
    add_index :words, :text, unique: true

    create_table :translated_words do |t|
      t.string :translation
      t.belongs_to :word

      t.timestamps
    end
    add_index :translated_words, :word_id

    create_table :sentences do |t|
      t.text :word_template
      t.integer :paragraph_index
      t.belongs_to :paragraph
      t.timestamps
    end

    create_table :sentences_words, id: false do |t|
      t.integer :sentence_id, null: false
      t.integer :word_id, null: false
      t.integer :sentence_index
    end
    add_index :sentences_words, [:sentence_id, :word_id]

    create_table :paragraphs do |t|
      t.timestamps
      t.integer :document_index
      t.belongs_to :document
    end

    create_table :documents do |t|
      t.string :title

      t.timestamps
    end
  end
end
