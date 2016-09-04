# # require 'sentenceword.rb'
#
# # the SentenceWord class is a little nonstandard, so we have to explicitly define it
#
# # also note we use the String "SentenceWord" instead of the actual class
# #   otherwise, the db:migrates fail, I think because the class does not yet exist
#
# FactoryGirl.define do
#   factory :sentenceword, :class => "SentenceWord" do
#     sentence_index 1
#   end
# end
