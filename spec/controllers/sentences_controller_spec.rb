require 'spec_helper'

describe SentencesController do
  render_views

  describe "SentencesController#create" do

    it "should route properly" do
      assert_routing( { :path => "sentences",
                        :method => :post },
                      { :controller => "sentences",
                        :action => "create" })
    end

    it "associates with an existing paragraph"

  end

end