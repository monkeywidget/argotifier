class Paragraph < ActiveRecord::Base
  has_many :sentences, :order => 'sentences.paragraph_index'

  ################## tokenize!  used after "create"


  # adapted from http://snippets.dzone.com/posts/show/1040
  # given a block of text, no carriage returns,
  #   output an array of sentences.
  # we want to split on  . ! ?  (not  or !" ?" which comes before .
  #                             - also disclude variants with ' )
  #  basically:   \?(?!('|"))|\.|!(?!('|"))
  #
  def parse_nonquoted_sentences ( paragraph_text )
    sentences = []
    scanner = StringScanner.new(paragraph_text)
    last_pos = 0
    while scanner.skip_until( /(\?(?!(\'|"))|\.|!(?!(\'|")))/  )
      non_delimiter = ''
      delimiter = ''

      matched_size = scanner.matched_size
      pos = scanner.pos
      # add the non-delimiter string if it exists
      # (it may not if the string starts with a delimiter)
      non_delimiter = paragraph_text[last_pos ... pos - matched_size] if last_pos < pos - matched_size
      # add the delimiter
      delimiter = paragraph_text[pos - matched_size ... pos]
      sentences << "%s%s" % [ non_delimiter, delimiter ]

      # update the last_pos to the current pos
      last_pos = pos
    end


    # add the last non-delimiter string if one exists after the last delimiter.
    # It would not have been added since s.skip_until would have returned nil

    sentences << paragraph_text[last_pos ... paragraph_text.length] if last_pos < paragraph_text.length

    sentences
  end

  private :parse_nonquoted_sentences

  # TODO refactor this into the Paragraph object lifecycle
  def tokenize(paragraph_text)

    # parse sentences"
    paragraph_index = 0

    sentences = parse_nonquoted_sentences( paragraph_text )

    sentences.each do |sentence_text|
      sentence = Sentence.create(:paragraph => self,
                                 :paragraph_index => paragraph_index )
      sentence.tokenize(sentence_text)

      paragraph_index = paragraph_index.next
    end


  end


  ################## render methods!

  def original
    original_sentences = []

    sentences.each do |sentence|
      original_sentences << sentence.original
    end

    original_sentences.join(" ")
  end


  def translation
    translated_sentences = []

    sentences.each do |sentence|
      translated_sentences << sentence.translation
    end

    translated_sentences.join(" ")
  end

end
