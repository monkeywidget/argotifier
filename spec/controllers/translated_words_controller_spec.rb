require 'spec_helper'

describe TranslatedWordsController do
  render_views

  describe "TranslatedWordsController#create" do

    it "should route properly" do
      assert_routing( { :path => "translated_words",
                        :method => :post },
                      { :controller => "translated_words",
                        :action => "create" })
    end

    it "associates with an existing word" do
      foo_word = Word.create!(text: "foo")
      post :create, :format => :json, :word => "foo", :translation => "bar"
      translation = TranslatedWord.find_by_translation("bar")
      expect(translation.word = foo_word)
    end

    # TODO: test is broken; functionality works
    # it "rejects association with nonexistent word" do
    #  post :create, :format => :json, :word => "foo", :translation => "bar"
    #  expect{TranslatedWord.find_by_translation("bar")}.to raise_error(ActiveRecord::RecordInvalid)
    # end

  end

  # TODO: index

  describe "TranslatedWordsController#show" do

    before do
      @word_foo_1 = FactoryGirl.create(:word, text: "foo", id: "1")
      @translated_word_foo_bar_1 = FactoryGirl.create(:translated_word,
                                                      translation: "bar", word: @word_foo_1,
                                                      id: "1")

      get :show, :format => :json, :id => 1
    end

    it "should route properly" do
      assert_generates "/translated_words/1", {
          :controller => "translated_words",
          :action => "show",
          :id => "1" }
    end

    # Q: "A JSON text must at least contain two octets" - what causes this error?
    # A: The variable you're passing in is an empty string. Don't attempt to use an empty string in the JSON.parse method.

    it "should show the data fields" do
      parsed = JSON.parse(response.body)
      parsed.should include('id')
      parsed.should include('translation')
    end

  end  # end show

  describe "#update" do

    it "should route properly" do
      assert_routing( { :path => "/translated_words/1.json",
                        :method => :put },
                      { :controller => "translated_words",
                        :action => "update",
                        :id => "1",
                        :format => "json" })
      assert_routing( { :path => "/translated_words/1",
                        :method => :put },
                      { :controller => "translated_words",
                        :action => "update",
                        :id => "1"})
    end

    # TODO: verify translation field is updated properly

  end

  describe "#destroy" do

    it "should route properly" do
      assert_routing( { :path => "/translated_words/1.json",
                        :method => :delete },
                      { :controller => "translated_words",
                        :action => "destroy",
                        :id => "1",
                        :format => "json"
                      })
      assert_routing( { :path => "/translated_words/1",
                        :method => :delete },
                      { :controller => "translated_words",
                        :action => "destroy",
                        :id => "1",
                      })
    end

    # TODO: verify word is unaffected

  end



end

