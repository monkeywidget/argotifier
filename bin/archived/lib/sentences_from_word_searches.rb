def sentence_utils_includes
  require 'word'
  require 'sentence'
  require 'sentenceword'
  require 'text_format'
  require 'translated_word'
end


def show_sentences_using_translations_like(substring)
  sentence_utils_includes

  puts "Showing sentences including translations like \"#{substring}\":\n\n"

  # is there a way to make this one Word - based find?:

  translations_matching_substring = TranslatedWord.where("translation LIKE ?", "%#{substring}%").order("translation")

  words_for_matching_translations = []

  if translations_matching_substring.nil? or translations_matching_substring.length == 0
    puts "\t(none)\n\n"
    return
  end

  translations_matching_substring.each do |translation|
    words_for_matching_translations << translation.word
  end

  show_sentences_using_words_in words_for_matching_translations

end

def show_sentences_using_words_in(words)

  if words.nil? or words.length == 0
    puts "\t(none)\n\n"
    return
  end

  words.each do |word|
    puts "\tIncluding \"#{word.text}\":"
    translation = TranslatedWord.find_by_word_id(word)
    if translation.nil?
      translated = false
    else
      translated = true
    end

    sentences_with_this_word = Sentence.joins(:words).where("sentences_words.word_id = ?", word)
    sentences_with_this_word.each do |sentence|
      puts "#{wrap_text(sentence.original, 50, "\t  ")}"

      if (translated)
        puts "\t       ---"
        puts "#{wrap_text(sentence.translation, 50, "\t  ")}"
      end

      puts "\n"
    end
  end

  puts "\n\n"
end

def show_sentences_using_words_like(substring)

  sentence_utils_includes

  puts "Showing sentences including words like \"#{substring}\":\n\n"

  words = Word.where("text LIKE ?", "%#{substring}%").order("text")

  show_sentences_using_words_in words

end

def show_count_of_words_like(substring)
  sentence_utils_includes

  words = Word.where("text LIKE ?", "%#{substring}%").order("text")

  puts "Showing counts for the words in the document like \"#{substring}\"\n\n"

  if words.nil? or words.length == 0
    abort("\t\t(none found)\n\n")
  end


  words.each do |word|

    sentence_count = Sentence.joins(:words).where("sentences_words.word_id = ?", word).length

    puts "\t#{word.text}: #{sentence_count}"
  end

  puts "\n\n"
end
