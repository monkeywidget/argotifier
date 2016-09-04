# require 'spec_helper'
#
# describe Paragraph do
#
#   before do
#     @sample_paragraph_text = "\"Beware the Jabberwock, my son!
#       The jaws that bite, the claws that catch!
#       Beware the Jubjub bird, and shun
#       The frumious Bandersnatch!\""
#   end
#
#   describe "#create" do
#
#     before do
#       @document = FactoryGirl.create(:document, title:"The Very Sad Tree")
#     end
#
#     it "creates with a document and a sequence in the document" do
#       paragraph = Paragraph.create!(document_index: 0, document: @document)
#       expect(Paragraph.exists?(paragraph))
#     end
#
#     it "requires a document" do
#       expect{Paragraph.create!(document_index: 1)}.to raise_error(ActiveRecord::RecordInvalid)
#     end
#
#     it "requires a sequence in the document" do
#       expect{Paragraph.create!(document: @document)}.to raise_error(ActiveRecord::RecordInvalid)
#     end
#
#     it "rejects a document order parameter duplicating another paragraph" do
#       Paragraph.create!(document: @document, document_index: 1)
#       expect{Paragraph.create!(document: @document, document_index: 1)}.to raise_error(ActiveRecord::RecordInvalid)
#     end
#
#     it "rejects a nonexistent document"
#
#   end
#
#   # note: this is the topmost tokenize-
#   #   there is no Document#tokenize
#   describe "#tokenize" do
#
#     before do
#       @document = FactoryGirl.create(:document, title:"The Very Sad Tree")
#       @paragraph = Paragraph.create!(document: @document, document_index: 3)
#       expect(@paragraph.sentences.count).to eq(0)
#     end
#
#     # catch basic errors in tokenize
#     it "tokenizes words" do
#       @paragraph.tokenize(@sample_paragraph_text)
#       expect(Paragraph.exists?(@paragraph)).to eq(true)
#     end
#
#
#     describe "after tokenizing" do
#
#       before do
#         @paragraph.tokenize(@sample_paragraph_text)
#       end
#
#       it "adds created Sentences to self" do
#         expect(@paragraph.sentences.count).to eq(3)
#         expect(Sentence.exists?(@paragraph.sentences.first)).to eq(true)
#         expect(@paragraph.sentences.first.original).to eq("\"Beware the Jabberwock, my son!")
#       end
#
#       it "maintains Sentence order" do
#         expect(@paragraph.sentences.first.original).to eq("\"Beware the Jabberwock, my son!")
#         expect(@paragraph.sentences[1].original).to eq("\n      The jaws that bite, the claws that catch!")
#         expect(@paragraph.sentences[2].original).to eq("\n      Beware the Jubjub bird, and shun\n      The frumious Bandersnatch!\"")
#       end
#
#     end
#
#   end # tokenize
#
#   describe "renderer" do
#
#     before do
#       @document = FactoryGirl.create(:document, title:"The Very Sad Tree")
#       @paragraph = Paragraph.create!(document: @document, document_index: 8)
#       @paragraph.tokenize(@sample_paragraph_text)
#     end
#
#     describe "without translation data" do
#
#       describe "#originals" do
#         it "renders Sentences without TranslatedWords" do
#           expect(@paragraph.original).to eq(@sample_paragraph_text)
#         end
#       end
#
#       describe "#translation" do
#         it "renders Sentences without TranslatedWords" do
#           expect(@paragraph.translation).to eq(@sample_paragraph_text)
#         end
#       end
#     end
#
#
#     describe "with translation data" do
#
#       before do
#         @translation_the = FactoryGirl.create(:translated_word, word: Word.find_by_text("the"), translation: "foo")
#         @translation_that = FactoryGirl.create(:translated_word, word: Word.find_by_text("that"), translation: "fnord")
#         @translation_beware = FactoryGirl.create(:translated_word, word: Word.find_by_text("beware"), translation: "pickle")
#       end
#
#       describe "#original" do
#
#         it "renders Sentences without TranslatedWords" do
#           expect(@paragraph.original).to eq(@sample_paragraph_text)
#         end
#
#       end
#
#       describe "#translation" do
#         it "renders Sentences with TranslatedWords" do
#           expect(@paragraph.translation).to eq("\"Pickle foo Jabberwock, my son!" +
#                                                "\n      Foo jaws fnord bite, foo claws fnord catch!" +
#                                                "\n      Pickle foo Jubjub bird, and shun" +
#                                                "\n      Foo frumious Bandersnatch!\"")
#         end
#       end
#
#     end
#
#   end # renderer
#
# end
