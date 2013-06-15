class WordsController < ApplicationController

  respond_to :json

  # non-REST: count
  def count
    respond_to do |format|
      format.json{ render :json => { :catalog_size => Word.all.count }     }
    end
  end
  # test manually with:
  #  curl -i -X GET -H "Content-Type: application/json" \
  #         http://localhost:3000/words/count



  # GET a list of all
  def index
    respond_with(@words = Word.all)
  end
  # test manually with:
  #  curl -i -X GET -H "Content-Type: application/json" \
  #          http://localhost:3000/words/


  # note: no form interface, so no "new" method



  # POST a new
  def create
    @word = Word.find_or_create_by_text(params[:text])

    respond_to do |format|
      if @word.save
        format.json { render json: @word, status: :created,
                             location: @word}
      else
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end
  # test manually with:
  #   curl -i -X POST  -H "Content-type: application/json" -d '{"text":"foo"}' \
  #        http://localhost:3000/words/



  # GET an existing
  def show
    @word = Word.find(params[:id])

    respond_to do |format|
      format.json  { render :json => @word }
    end
  end
  # test manually with:
  #   curl -i -X GET -H "Content-Type: application/json" http://localhost:3000/words/1



  # PUT a new record for an existing
  def update
    @word = Word.find(params[:id])

    respond_to do |format|
      if @word.update_attributes(params[:text])
        format.json  { head :no_content }
      else
        format.json  { render :json => @word.errors,
                              :status => :unprocessable_entity }
      end
      end
  end
  # TODO: broken in some way
  # test manually with:
  #   curl -v -H "Accept: application/json" -H "Content-type: application/json" \
  #       -X PUT -d '{"text":"garply"}' http://localhost:3000/words/2.json

  # DELETE a record
  def destroy
    @word = Word.find(params[:id])
    @word.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end
  # test manually with:
  #  curl -i -H "Accept: application/json" -X DELETE  http://localhost:3000/words/2.json


end