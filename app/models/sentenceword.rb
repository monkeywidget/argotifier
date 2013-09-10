class SentenceWord < ActiveRecord::Base
  belongs_to :sentence
  belongs_to :word

  # this class has to be its own class (vs has_and_belongs_to_many) because of the sentence_index column

  set_table_name "sentences_words"   # this is to avoid the annoying "SentencesWord" class name (half plural)
end
