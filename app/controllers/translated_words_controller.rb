class TranslatedWordsController < ApplicationController

  respond_to :json

  # POST a new
  def create
    # @word = Word.find_or_create_by_text(params[:text])

    # respond_to do |format|
    #  if @word.save
    #    format.json { render json: @word, status: :created,
    #                         location: @word}
    #  else
    #    format.json { render json: @word.errors, status: :unprocessable_entity }
    #  end
    #end
  end
  # test manually with:
  #   curl -i -X POST  -H "Content-type: application/json" -d '{"word":"foo","translation":"bar"}' \
  #        http://localhost:3000/translated_words/


end