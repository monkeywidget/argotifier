require 'word_finders'

def show_translations_like(substring)
  show_untranslated_words_like substring
  show_translations_of substring
  show_translations_to substring
  show_counts_of_translations_like substring
end

def show_translations_of(text_substring)
  require 'translated_word'
  require 'word'

  puts "Words like \"#{text_substring}\" that have translations:\n\n"

  words_with_translations = Word.where("text LIKE ?", "%#{text_substring}%").translated.order("text")

  if words_with_translations.nil? or words_with_translations.length == 0
    puts "\t(none)\n\n"
    return
  end

  words_with_translations.each do |word|

    translation = TranslatedWord.find_by_word_id(word)

    puts "\t#{word.text} => #{translation.translation}"
  end

  puts "\n"

end

def show_translations_to(translated_text)
  require 'translated_word'
  require 'word'

  puts "Words translated to things like \"#{translated_text}\" :\n\n"

  translations = TranslatedWord.where("translation LIKE ?", "%#{translated_text}%").order("translation")

  if translations.nil? or translations.length == 0
    puts "\t(none)\n\n"
    return
  end

  puts "\tNumber of original words: #{translations.length}"

  translations.each do |translation|
    puts "\t#{translation.word.text} => #{translation.translation}"
  end

  puts "\n\n"

end


def show_counts_of_translations_like(substring)

  puts "Number of occurrences of translations like \"#{substring}\" :\n\n"


  translated_word_sentence_count_sql = "SELECT tw.translation, COUNT(w.id) AS sentence_count " +
                                        "FROM translated_words tw " +
                                        "JOIN words w ON w.id = tw.word_id " +
                                        "JOIN sentences_words sw ON sw.word_id = w.id " +
                                        "WHERE tw.translation LIKE \'%#{substring}%\' " +
                                        "GROUP BY tw.translation ORDER BY tw.translation"

  translated_words_with_sentence_counts = TranslatedWord.connection.select_rows( translated_word_sentence_count_sql  )

  puts "\tNumber of translated words: #{translated_words_with_sentence_counts.length}"

  translated_words_with_sentence_counts.each do |translation|
    puts "\t#{translation[0]}: #{translation[1]}"
  end

  puts "\n\n"

end
