class SentencesController < ApplicationController

  respond_to :json


  # GET a list of all
  def index
    respond_with(@sentences= Sentence.all)
  end
  # test manually with:
  #  curl -i -X GET -H "Content-Type: application/json" \
  #          http://localhost:3000/sentences/


  # POST a new
  def create
    @sentence = Sentence.create!(params[:paragraph], params[:paragraph_index])
    @sentence.tokenize(@params[:text])

    respond_to do |format|
      if @sentence.save
        format.json { render json: @sentence, status: :created,
                             location: @sentence}
      else
        format.json { render json: @sentence.errors, status: :unprocessable_entity }
      end
    end

  end
  # test manually with:
  #   curl -i -X POST  -H "Content-type: application/json" \
  #        -d '{"text":"The QUICK brown fox jumped over the lazy-dogs!","paragraph":"1","paragraph_index":"1"}' \
  #        http://localhost:3000/sentences/

  # GET an existing
  def show
    @sentence = Sentence.find(params[:id])

    respond_to do |format|
      format.json  { render :json => @sentence }
    end
  end
  # test manually with:
  #   curl -i -X GET -H "Content-Type: application/json" http://localhost:3000/sentences/1


  # DELETE a record
  def destroy
    @sentence = Sentence.find(params[:id])
    @sentence.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end
  # test manually with:
  #  curl -i -H "Accept: application/json" -X DELETE  http://localhost:3000/sentences/2.json


end