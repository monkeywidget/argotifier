class DocumentsController < ApplicationController

  respond_to :json

  # GET a list of all
  def index
    respond_with(@documents= Document.all)
  end
  # test manually with:
  #  curl -i -X GET -H "Content-Type: application/json" \
  #          http://localhost:3000/documents/


  # POST a new
  def create
    @document = Document.find_or_create_by_title(params[:title])

    respond_to do |format|
      if @document.save
        format.json { render json: @document, status: :created,
                         location: @document}
      else
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end

  end
  # test manually with:
  #   curl -i -X POST  -H "Content-type: application/json" \
  #        http://localhost:3000/documents/

  # GET an existing
  def show
    @document = Document.find(params[:id])

    respond_to do |format|
      format.json  { render :json => @document }
    end
  end
  # test manually with:
  #   curl -i -X GET -H "Content-Type: application/json" http://localhost:3000/documents/1


  # DELETE a record
  def destroy
    @document = Document.find(params[:id])
    @document.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end
  # test manually with:
  #  curl -i -H "Accept: application/json" -X DELETE  http://localhost:3000/documents/2.json


end  # document controller