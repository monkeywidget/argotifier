class SentencesController < ApplicationController

  respond_to :json

  # POST a new
  def create
    sentence = Sentence.create!(params[:text], params[:paragraph], params[:paragraph_order])
  end

end