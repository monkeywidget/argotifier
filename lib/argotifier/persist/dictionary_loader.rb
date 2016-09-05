# require 'active_record'
# require_relative '../argotifier_client'
# require_relative '../../../app/models/translated_word'
# require_relative '../../../app/models/word'
#
# module Argotifier
#   class DictionaryLoader < ArgotifierClient
#     def initialize(filename_csv)
#       establish_connection
#
#       file = File.open(filename_csv, "r")
#       file.each_line do |line|
#         line.gsub!(/\r\n?/, "\n")
#         word_text, translation_text = line.chop.split ","
#
#         if word_text.nil? or word_text.eql? "" or
#             translation_text.nil? or translation_text.eql? ""
#           abort("Bad line in file \"#{filename}\": line is \"#{line.chop}\"")
#         end
#
#         # word = Word.find_or_create_by(text: word_text)
#         word = Word.find_or_create_by(word_text)
#
#         translated_word = TranslatedWord.find_by_word_id( word )
#
#         if translated_word.nil?
#           translated_word = TranslatedWord.create!( :word => word,
#                                                     :translation => translation_text)
#         end
#
#         translated_word.translation = translation_text
#         translated_word.save
#
#       end
#
#       file.close
#
#       puts "dictionary loaded from file \"#{filename}\""
#     end
#   end
# end
