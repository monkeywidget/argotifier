# http://everydayrails.com/2012/04/07/testing-series-rspec-controllers.html
# Devise: https://github.com/plataformatec/devise/wiki/How-To:-Controllers-tests-with-Rails-3-(and-rspec)
# FactoryGirl http://stackoverflow.com/questions/13620919/testing-rails-controller-with-rspec-value-is-same-but-object-id-is-different

# http://codereview.stackexchange.com/questions/17860/rspec-integration-tests-for-a-simple-rails-api

require 'spec_helper'

describe WordsController do
  render_views

  before do
    @word_one = FactoryGirl.create(:word, text: "foo")
    @word_two = FactoryGirl.create(:word, text: "bar")
    @word_three = FactoryGirl.create(:word, text: "baz")
  end

  describe "#count" do

    it "should route properly" do
      assert_routing( { :path => "words/count",
                        :method => :get },
                      { :controller => "words",
                        :action => "count" })
    end

    it "should tell how many" do
      word.reload
      # word_x, word_y = Word.create!("x"), Word.create!("y")
      get :count
      assigns(:catalog_size).should eq(3)
    end
  end

  describe "#index" do

    before do
      get :index, :format => :json
    end

    it "should retrieve status code of 200" do
      response.response_code.should == 200
    end

    # lists the right number of objects

    # can list 0 of objects

  end

  # create

  describe "#show" do

    it "should route properly" do
      assert_generates "/words/1", {
          :controller => "words",
          :action => "show",
          :id => "1" }
    end


  end

  # update
  # destroy

end