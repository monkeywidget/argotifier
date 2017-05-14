# frozen_string_literal: true
# # http://everydayrails.com/2012/04/07/testing-series-rspec-controllers.html
# # Devise: https://github.com/plataformatec/devise/wiki/How-To:-Controllers-tests-with-Rails-3-(and-rspec)
# # FactoryGirl http://stackoverflow.com/questions/13620919/testing-rails-controller-with-rspec-value-is-same-but-object-id-is-different
#
# # http://codereview.stackexchange.com/questions/17860/rspec-integration-tests-for-a-simple-rails-api
#
# require 'spec_helper'
#
# describe WordsController do
#   render_views
#
#   describe "when there are 0 words" do
#     describe "#index" do
#
#       before do
#         get :index, :format => :json
#       end
#
#       it "can list 0 of objects" do
#         response.should be_success
#         parsed = JSON.parse(response.body)
#         parsed.should have(0).items
#       end
#
#     end
#   end
#
#   describe "when there are several words" do
#
#     before do
#       @word_one = FactoryGirl.create(:word, text: "foo", id: "1")
#       @word_two = FactoryGirl.create(:word, text: "bar", id: "8")
#       @word_three = FactoryGirl.create(:word, text: "baz", id: "2000")
#     end
#
#     describe "#count" do
#
#       before do
#         get :count, :format => :json
#       end
#
#       it "should route properly" do
#         assert_routing( { :path => "words/count",
#                           :method => :get },
#                         { :controller => "words",
#                           :action => "count" })
#       end
#
#       it "should tell how many" do
#         parsed = JSON.parse(response.body)
#         parsed.should include('catalog_size')
#         parsed['catalog_size'].should == 3
#       end
#
#     end
#
#     describe "#index" do
#
#       before do
#         get :index, :format => :json
#       end
#
#       it "should retrieve status code of 200" do
#         response.response_code.should == 200
#       end
#
#
#       it "lists the right number of objects" do
#         response.should be_success
#         parsed = JSON.parse(response.body)
#         parsed.should have(3).items
#       end
#
#     end
#
#     describe "#create" do
#
#       it "should route properly" do
#         assert_routing( { :path => "words",
#                           :method => :post },
#                         { :controller => "words",
#                           :action => "create" })
#       end
#
#     end
#
#     describe "#show" do
#       before do
#         get :show, :format => :json, :id => 1
#       end
#
#       it "should route properly" do
#         assert_generates "/words/1", {
#             :controller => "words",
#             :action => "show",
#             :id => "1" }
#       end
#
#       it "should show the data fields" do
#         parsed = JSON.parse(response.body)
#         parsed.should include('id')
#         parsed.should include('text')
#       end
#
#     end
#
#     describe "#update" do
#
#       it "should route properly" do
#         assert_routing( { :path => "/words/1.json",
#                           :method => :put },
#                         { :controller => "words",
#                           :action => "update",
#                           :id => "1",
#                           :format => "json" })
#         assert_routing( { :path => "/words/1",
#                           :method => :put },
#                         { :controller => "words",
#                           :action => "update",
#                           :id => "1"})
#       end
#
#     end
#
#     describe "#destroy" do
#
#       it "should route properly" do
#         assert_routing( { :path => "/words/1.json",
#                           :method => :delete },
#                         { :controller => "words",
#                           :action => "destroy",
#                           :id => "1",
#                           :format => "json"
#                         })
#         assert_routing( { :path => "/words/1",
#                           :method => :delete },
#                         { :controller => "words",
#                           :action => "destroy",
#                           :id => "1",
#                         })
#       end
#
#     end
#
#   end
# end
