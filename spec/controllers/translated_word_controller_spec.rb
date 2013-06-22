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

    # it "associates with an existing word" do
    # end

    #it "rejects association with nonexistent word" do
    # end

  end


end


