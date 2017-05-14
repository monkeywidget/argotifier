# frozen_string_literal: true
# describe SentencesController do
#   render_views
#
#   before do
#     @paragraph_text = "\"Beware the Jabberwock, my son!
#     The jaws that bite, the claws that catch!
#     Beware the Jubjub bird, and shun
#     The frumious Bandersnatch!\""
#   end
#
#   describe "#create" do
#
#     it "should route properly" do
#       assert_routing( { :path => "sentences",
#                         :method => :post },
#                       { :controller => "sentences",
#                         :action => "create" })
#     end
#
#     # didn't work, so add a test for this:
#     # curl -i -X POST  -H "Content-type: application/json" -d '{"text":"The QUICK brown fox jumped over the lazy-dogs!",
#                                                     "paragraph":"1","paragraph_index":"1"}' http://localhost:3000/sentences/
#
#     # paragraph validation in the model specs
#
#     it "both creates and tokenizes the sentence" do
#
#       pending
#       # @paragraph = Paragraph.create!()
#       # @paragraph = FactoryGirl.create(:paragraph)
#
#       # post :create, :paragraph => "1", :paragraph_index => "0"
#       # Sentence.should_receive(:tokenize).with(@paragraph_text)
#
#       # post :create, sentence: {:paragraph => @paragraph }
#       # post :create, :post {:paragraph => @paragraph,
#       #                        :paragraph_index => '0' # , :text => @paragraph_text
#       #                        }
#     end
#
#   end
#
# end
