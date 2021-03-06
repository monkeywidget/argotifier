class TranslatedWordsController < ApplicationController

  respond_to :json

  # POST a new
  def create
    word = Word.find_by_text(params[:word])
    if word.nil?
      # puts "word was nil"
      raise ActiveRecord::RecordInvalid.new(@translated_word)
    end

    @translated_word = TranslatedWord.create(:translation => params[:translation],
                                             :word => word)

    respond_to do |format|
      if @translated_word.save
        format.json { render json: @translated_word,
                             status: :created,
                              location: @translated_word
        }
      else
        format.json { render json: @translated_word.errors,
                             status: :unprocessable_entity
        }
      end
    end
  end
  # test manually with:
  #   curl -i -X POST  -H "Content-type: application/json" -d '{"word":"foo","translation":"bar"}' \
  #        http://localhost:3000/translated_words/


  # GET a list of all
  def index
    # respond_with(@translated_words = TranslatedWord.all)

    @translated_words = TranslatedWord.all

    respond_to do |format|
      format.json { render :json => @translated_words.to_json(:include => [:word]) }
    end
  end
  # test manually with:
  #  curl -i -X GET -H "Content-Type: application/json" \
  #          http://localhost:3000/translated_words/


  # note: no form interface, so no "new" method



  def show_by_translation
    @translated_word = TranslatedWord.find_by_translation(params[:translation])
    respond_to do |format|
      format.json do
        render :json => @translated_word.to_json(:include => :word )
      end
    end
  end
  # test manually with:
  # curl -i -X GET -H "Content-Type: application/json" http://localhost:3000/translated_words/by_translation/bar


  def show_by_original_word
    @translated_word = TranslatedWord.find_by_word_id(Word.find_by_text(params[:wordtext]))
    respond_to do |format|
      format.json do
        render :json => @translated_word.to_json(:include => :word )
      end
    end
  end
  # test manually with:
  # curl -i -X GET -H "Content-Type: application/json" http://localhost:3000/translated_words/by_original_word/foo




  # GET an existing
  # because this is for REST and not for the business logic, it shows the id
  # see also the "lookup" methods
  def show
    @translated_word = TranslatedWord.find(params[:id])

    respond_to do |format|
      format.json do
        # render :json => @translated_word.to_json(:include => { :word => { :only => :text } })
        render :json => @translated_word.to_json(:include => :word )
      end
    end
  end
  # test manually with:
  #   curl -i -X GET -H "Content-Type: application/json" http://localhost:3000/translated_words/1

  # PUT a new record for an existing
  # only updates translation, not the word it's translating
  def update
    @translated_word = TranslatedWord.find(params[:id])

    respond_to do |format|
      if @translated_word.update_attributes(params[:translation])
        format.json  { head :no_content }
      else
        format.json  { render :json => @translated_word.errors,
                              :status => :unprocessable_entity }
      end

    end
  end
  # test manually with:
  #   curl -v -H "Accept: application/json" -H "Content-type: application/json" \
  #       -X PUT -d '{"translated_word":{"translation":"garply"}}' http://localhost:3000/translated_words/2.json


  # DELETE a record
  def destroy
    @translated_word = TranslatedWord.find(params[:id])
    @translated_word.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end
  # test manually with:
  #  curl -i -H "Accept: application/json" -X DELETE  http://localhost:3000/translated_words/2.json

end