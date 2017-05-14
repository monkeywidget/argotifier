# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130927210058) do

  create_table "documents", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paragraphs", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "document_index"
    t.integer  "document_id"
  end

  create_table "sentences", force: :cascade do |t|
    t.text     "word_template"
    t.integer  "paragraph_index"
    t.integer  "paragraph_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sentences_words", id: false, force: :cascade do |t|
    t.integer "sentence_id",    null: false
    t.integer "word_id",        null: false
    t.integer "sentence_index"
    t.index ["sentence_id", "word_id"], name: "index_sentences_words_on_sentence_id_and_word_id"
  end

  create_table "translated_words", force: :cascade do |t|
    t.string   "translation"
    t.integer  "word_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["word_id"], name: "index_translated_words_on_word_id"
  end

  create_table "words", force: :cascade do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["text"], name: "index_words_on_text", unique: true
  end

end
