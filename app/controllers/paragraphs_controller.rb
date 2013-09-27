class ParagraphsController < ApplicationController

  respond_to :json

  # NEW / CREATE: used in command line only, so no controller methods

  # GET a list of all
  def index
    respond_with(@paragraphs= Paragraph.all)
  end
# test manually with:
#  curl -i -X GET -H "Content-Type: application/json" \
#          http://localhost:3000/paragraphs/


  # GET an existing
  def show
    @paragraph = Paragraph.find(params[:id])

    # TODO: render the paragraph both ways in the json

    respond_to do |format|
      format.json  { render :json => @paragraph, :methods => [:original, :translation] }
    end


  end
  # test manually with:
  #   curl -i -X GET -H "Content-Type: application/json" http://localhost:3000/sentences/1



end