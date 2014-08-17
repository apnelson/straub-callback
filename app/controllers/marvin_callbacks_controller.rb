class MarvinCallbacksController < ApplicationController
  before_action :set_marvin_callback, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:callback_handler]
  # GET /marvin_callbacks
  # GET /marvin_callbacks.json
  def index
    @marvin_callbacks = MarvinCallback.all
  end

  def callback_handler
    require 'nokogiri'
    @marvin_callback = MarvinCallback.new(marvin_callback_params)
    @marvin_callback.raw_xml = request.body.read
    xml_data = Nokogiri::Slop(@marvin_callback.raw_xml)
    @marvin_callback.import_status = xml_data.FileImportStatus.import_status.content
    @marvin_callback.import_status_details = xml_data.FileImportStatus.import_status_details.content

    if @marvin_callback.save
      head :ok, :content_type => 'text/html'
    else
      head :bad_request, :content_type => 'text/html'
    end

  end

  # GET /marvin_callbacks/1
  # GET /marvin_callbacks/1.json
  def show
  end

  # GET /marvin_callbacks/new
  def new
    @marvin_callback = MarvinCallback.new
  end

  # GET /marvin_callbacks/1/edit
  def edit
  end

  # POST /marvin_callbacks
  # POST /marvin_callbacks.json
  def create
    @marvin_callback = MarvinCallback.new(marvin_callback_params)

    respond_to do |format|
      if @marvin_callback.save
        format.html { redirect_to @marvin_callback, notice: 'Marvin callback was successfully created.' }
        format.json { render :show, status: :created, location: @marvin_callback }
      else
        format.html { render :new }
        format.json { render json: @marvin_callback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /marvin_callbacks/1
  # PATCH/PUT /marvin_callbacks/1.json
  def update
    respond_to do |format|
      if @marvin_callback.update(marvin_callback_params)
        format.html { redirect_to @marvin_callback, notice: 'Marvin callback was successfully updated.' }
        format.json { render :show, status: :ok, location: @marvin_callback }
      else
        format.html { render :edit }
        format.json { render json: @marvin_callback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marvin_callbacks/1
  # DELETE /marvin_callbacks/1.json
  def destroy
    @marvin_callback.destroy
    respond_to do |format|
      format.html { redirect_to marvin_callbacks_url, notice: 'Marvin callback was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marvin_callback
      @marvin_callback = MarvinCallback.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def marvin_callback_params
      params.permit(:guid, :orig_stamp)
    end
end
