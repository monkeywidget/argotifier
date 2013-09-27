class Sentence < ActiveRecord::Base
  has_many :sentence_words
  has_many :words, :through => :sentence_words,
           :order => 'sentences_words.sentence_index'      # note: the DB table name is not the same as the class
  belongs_to :paragraph
  validates_presence_of :paragraph, :paragraph_index
  validates_uniqueness_of :paragraph_index, scope: [:paragraph_id]

  # http://edgeguides.rubyonrails.org/active_record_callbacks.html
  # before create: reject invalid text

  # http://stackoverflow.com/questions/6619333/createing-associated-record-in-before-create-callback
  # after_save convert_text_to_word_template



############################################## creating data / populating fields


  # !destroys the lists in the parameters!
  # needs two similarly-sized arrays because they interleave
  #    we assume the not-words comes first, and therefore may have an initial empty element
  def create_word_template! ( list_of_words, notwords_list )

    # VALIDATE the lists: neither is nil:
    raise ArgumentError.new "list of words provided for Sentence %d is nil" % self.id if list_of_words.nil?
    raise ArgumentError.new "list of not-words provided for Sentence %d is nil" % self.id if notwords_list.nil?

    # VALIDATE the lists: not-words (the punctuation) is equal or one larger than words, because they interleave
    size_difference = notwords_list.length - list_of_words.length
    if size_difference > 1 or size_difference < 0
      raise ArgumentError.new "Sentence %d not-words length out of sync with words:" +
                                  " (nw:[%s], w:[%s])" % [ self.id, notwords_list.length, list_of_words.length]
    end

    # AT THIS POINT we have:
    # words - a list of all the words
    # notwords - a list of the stuff that surrounds the words
    #             such that notwords and words are interleaved,
    #             such that notwords elements are first (possibly empty),
    #                  and notwords elements last if present

    # KEY:
    #   x: all lower case
    #   c: capitalized first letter
    #   C: entirely capitals

    sentence_pattern = []          # build something like
                                   #   C x, "c x!"
                                   #     for
                                   #   I said, "Don't walk!"

    while not (notwords_list.empty? and list_of_words.empty?)

      sentence_pattern.push notwords_list.shift if not notwords_list.empty?

      sentence_pattern.push Word.to_template(list_of_words.shift) if not list_of_words.empty?

    end

    self.word_template = sentence_pattern.join("")

  end

  def separate_words_from_nonword_characters(sentence_text)
    words_list = sentence_text.scan( /[\w-]+/ )     # (English) words
    notwords_list = sentence_text.scan( /[^\w-]+/ ) # punctuation and spaces
                                               #
                                               # ... grouped together as they would be in between the words
                                               #
                                               # e.g. "Do! not! tell mom about that?" would make
                                               #      [ "! ",
                                               #             "! ",
                                               #                   " ",
                                               #                       " ",
                                               #                             " ",
                                               #                                  "?" ]


                                               # if a non-word begins the sentence, all is well
                                               # however if it's a word, we need to add an element to the start
                                               # (because we assume it is first when building the pattern
    if sentence_text =~ /^[\w-]/
      notwords_list.unshift ""
    end

    return words_list, notwords_list
  end

  def find_or_create_words_in(words_list)

    sentence_index = 0

    words_list.each do |word|
      this_word = Word.find_or_create_by_text( word.downcase )

      SentenceWord.create( :sentence => self,
                                :sentence_index => sentence_index,
                                :word => this_word )

      sentence_index = sentence_index.next
    end
  end


  private :create_word_template!, :separate_words_from_nonword_characters, :find_or_create_words_in


  # TODO refactor this into the Sentence object lifecycle
  def tokenize(sentence_text)

    if sentence_text.nil? or sentence_text.length < 1
      raise ArgumentError.new "Tried to tokenize invalid text for Sentence %d" % self.id
    end

    words_list, notwords_list = separate_words_from_nonword_characters(sentence_text)

    find_or_create_words_in(words_list)

      # do this one last because it destroys the arrays (via shift)
    create_word_template!(words_list, notwords_list)

    raise AssertionError "Sentence didn't create word template!" unless defined?(self.word_template) && (self.word_template != '')

    self.save
  end

############################################## rendering translation or original

  # returns a list of the words, in order, with translations where appropriate
  def translated_words
    translated_words_list = []

    words.each do |word|
      translation_for_this_word = TranslatedWord.find_by_word_id(word.id)

      if translation_for_this_word.nil?
        translated_words_list << word.text                     # the original word text
      else
        translated_words_list << translation_for_this_word.translation
      end
    end

    translated_words_list
  end

  # used for TranslatedWords
  def apply_template_to_texts_in ( word_list )
    apply_template_to_words_or_texts_in(word_list) { |pattern_character, word_list| Word.render_text_with_template(word_list.shift, pattern_character) }
  end

  # used for Words
  def apply_template_to_words_in ( word_list )
    apply_template_to_words_or_texts_in(word_list) { |pattern_character, word_list| word_list.shift.rendered_with(pattern_character) }
  end

  # helper function used for rendering both Words and TranslatedWords
  def apply_template_to_words_or_texts_in (word_list, &render)
    sentence_pattern = self.word_template.split(//)    # reduce the template to just characters

    output_sentence = []      # the outputted sentence as an array (join before return)

    sentence_pattern.each do |pattern_character|

      if pattern_character !~ /^[xCc]$/     # if matching the formatting characters, convert
        output_sentence << pattern_character

      else            # otherwise just output directly (because it's punctuation)
        output_sentence << render.yield(pattern_character, word_list)
      end

    end

    output_sentence.join("")
  end

  private :translated_words, :apply_template_to_words_in,
          :apply_template_to_words_or_texts_in, :apply_template_to_texts_in

  def original
    apply_template_to_words_in(words)
  end

  def translation
    # TODO: if there is a Sentence-specific translation, use that and return

    apply_template_to_texts_in(translated_words)  # translated_words TEXT generated by helper, above
  end

end
