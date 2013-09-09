class SentenceWord < ActiveRecord::Base
  belongs_to :sentence
  belongs_to :word
end



class Sentence < ActiveRecord::Base
  has_many :sentence_words
  has_many :words, :through => :sentence_words,
           :order => 'sentence_words.sentence_index'
  belongs_to :paragraph

  # http://edgeguides.rubyonrails.org/active_record_callbacks.html
  # before create: reject invalid text

  # http://stackoverflow.com/questions/6619333/createing-associated-record-in-before-create-callback
  # after_save convert_text_to_word_template

  # TODO how to refactor this into the Sentence object lifecycle?
  def tokenize(text)

    words = sentence_text.scan( /[\w-]+/ )     # (English) words
    notwords = sentence_text.scan( /[^\w-]+/ ) # punctuation and spaces

    # if a non-word begins the sentence, all is well
    # however if it's a word, we need to add an element to the start
    if sentence_text =~ /^[\w-]/
      notwords.unshift ""
    end


    # AT THIS POINT we have:
    # words - a list of all the words
    # notwords - a list of the stuff that surrounds the words
    #             such that notwords and words are interleaved,
    #             such that notwords elements are first and last

    # build sentence_pattern :
    # sentence_pattern = notwords.join("x") # does the simple "x" for all

    # KEY:
    #   x: all lower case
    #   c: capitalized first letter
    #   C: entirely capitals

    sentence_pattern = []
    words_list = Array.new(words)  # copy so we can destroy one
    # the reason behind this is to build the
    # Sentence pattern first (destructive)
    #
    # ...otherwise we could use the same one

    # build something like
    #   C x, "c x!"
    #     for
    #   I said, "Don't walk!"
    while not (notwords.empty? and words_list.empty?)
      if not notwords.empty?
        sentence_pattern << notwords.shift
      end
      if not words_list.empty?
        sentence_pattern << Word.to_template(words_list.shift)
      end
    end

    word_template = sentence_pattern.join("")
    sentence_index = 0

    # puts "DEBUG: w: %s\n" % words.join(" ")

    words.each do |word|
      # puts "\tDEBUG: >>%s<<\n" % word.downcase

      this_word = Word.find_or_create_by_text( word.downcase )

      sw = SentenceWord.create( :sentence => sentence,
                                :sentence_index => sentence_index,
                                :word => this_word )

      sentence_index = sentence_index.next
    end

  end


  # returns a list of the words, in order, with translations where appropriate
  def translated_words
    translated_words_list = []

    words.each do |word|
      translation_for_this_word = TranslatedWord.find_by_word_id(word.id)

      if ( translation_for_this_word.nil? )
        translated_words_list << word.text                     # the original word text
      else
        translated_words_list << translation_for_this_word.translation
      end
    end

    translated_words_list
  end

  def apply_template_to_words_in ( translated_word_list )

    # reduce the template to just characters
    translation_pattern = word_template.split(//)

    # the outputted sentence as an array
    translated_sentence = []

    translation_pattern.each do |pattern_character|

      if pattern_character !~ /^[xCc]$/
        # if matching the formatting characters, convert
        translated_sentence << pattern_character
      else
        # otherwise just output directly (because it's punctuation)
        translated_sentence << translated_word_list.shift.rendered_with(pattern_character)
      end

    end

    translated_sentence.join("")
  end

  private :translated_words, :apply_template_to_words_in

  def original
    apply_template_to_words_in(words)
  end

  def translation
    # TODO: if there is a Sentence-specific translation, use that and return

    # the array of the words to put in the sentence
    translated_word_list = translated_words

    apply_template_to_words_in(translated_word_list)
  end

end
