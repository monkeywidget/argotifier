require 'spec_helper'

describe PagesController do
  render_views

  describe "Pages #show" do
    before do
      get :show, :format => :json, :id => 1
    end

    it "should route properly" do
      assert_generates "/pages/1", {
          :controller => "pages",
          :action => "show",
          :id => "1" }
    end

    it "should show the data fields" do
      parsed = JSON.parse(response.body)
      parsed.should include('index')
      parsed.should include('contents')
    end

  end

end
