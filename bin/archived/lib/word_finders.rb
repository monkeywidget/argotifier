
def show_random_untranslated_word
  require 'word'

  puts "Showing a random untranslated word\n\n"

  # TODO: there has got to be a faster way for this!
  offset = rand(Word.count)
  word = Word.untranslated.first(:offset => offset)

  puts "\t#{word.text}\n\n"

end

def show_untranslated_words_like(substring)
  require 'word'

  puts "Showing the untranslated words in the document like \"#{substring}\"\n\n"

  # untranslated_words = Word.untranslated.order("text")
  untranslated_words = Word.where("text LIKE ?", "%#{substring}%").untranslated.order("text")

  if untranslated_words.nil? or untranslated_words.length == 0
    puts "\t\t(none found)\n\n"
    return
  end

  untranslated_words.each do |word|
    puts "\t#{word.text}"
  end

  puts "\n\n"

end

def show_words_like(substring)
  require 'word'

  words = Word.where("text LIKE ?", "%#{substring}%").order("text")

  puts "Showing the words in the document like \"#{substring}\"\n\n"

  if words.nil? or words.length == 0
    abort("\t\t(none found)\n\n")
  end


  words.each do |word|
    puts "\t#{word.text}"
  end

  puts "\n\n"
end
