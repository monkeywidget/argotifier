class ParagraphsController < ApplicationController

  respond_to :json

  # POST a new paragraph
  def create

    document = Document.find(params[:document])
    # TODO: doesn't actually prevent this!
    if document.nil?
      raise ActiveRecord::RecordInvalid.new(@paragraph)
    end

    @paragraph = Paragraph.create!(:document => document,
                                   :document_index => params[:document_index])
    @paragraph.tokenize(params[:text])

    puts "blah!"

    respond_to do |format|
      if @paragraph.save
        format.json { render json: @paragraph, status: :created,
                             location: @paragraph}
      else
        format.json { render json: @paragraph.errors, status: :unprocessable_entity }
      end
    end

  end
  # test manually with:
  #   curl -i -X POST  -H "Content-type: application/json" \
  #        -d '{"text":"Beware the Jabberwock, my son!\\nThe jaws that bite, the claws that catch! Beware the Jubjub bird,\\nand shun The frumious Bandersnatch!","document":"1","document_index":"1"}' \
  #        http://localhost:3000/paragraphs/


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