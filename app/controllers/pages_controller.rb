class PagesController < ApplicationController
  respond_to :json

  # GET by page index
  def show
    # TODO: this is a placeholder for logic using Sentence
    render :json => { :index => params[:id],
                      :contents => "SERVER: this would be the contents of page " + params[:id]
                    }
  end
  # test manually with:
  #   curl -i -X GET -H "Content-Type: application/json" http://localhost:3000/pages/1


end