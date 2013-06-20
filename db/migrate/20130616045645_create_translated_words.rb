class CreateTranslatedWords < ActiveRecord::Migration
  def change
    create_table :translated_words do |t|
      t.string :translation
      t.belongs_to :word

      t.timestamps
    end
    add_index :translated_words, :word_id
  end
end
