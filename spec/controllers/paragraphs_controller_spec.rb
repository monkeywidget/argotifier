require 'spec_helper'

describe ParagraphsController do
  render_views

  # there's no way to Create/Update/Destroy paragraphs through the API

  describe "#index" do

    it "should route properly" do
      assert_generates "/paragraphs", {
          :controller => "paragraphs",
          :action => "index" }
    end

  end

  describe "#show" do

    it "should route properly" do
      assert_generates "/paragraphs/1", {
          :controller => "paragraphs",
          :action => "show",
          :id => "1" }
    end

    it "should include original sentences"
    it "should include translated sentences"

=begin
        parsed = JSON.parse(response.body)
        parsed.should include('catalog_size')
        parsed['catalog_size'].should == 3
=end

  end




end