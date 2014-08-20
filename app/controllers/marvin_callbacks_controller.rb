class MarvinCallbacksController < ApplicationController
  before_action :set_marvin_callback, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:callback_handler]
  skip_before_action :authenitcate_user!, only: [:callback_handler]
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

    file =  Date.today.strftime('%Y-%m-%d') + "_MPIII_MARVIN_XML_Callback"
    file += @marvin_callback.import_status.downcase == 'successful' ? "s.txt" : "_ERRORS.txt"

    fd = File.open("callback_logs/" + file, "a+")
    fd.write @marvin_callback.raw_xml + "\n"
    fd.close

    if @marvin_callback.save
      head :ok, :content_type => 'text/html'
    else
      head :bad_request, :content_type => 'text/html'
    end

  end

  # GET /marvin_callbacks/1
  # GET /marvin_callbacks/1.json
  def show
    respond_to do |format|
      format.html { render partial: 'show' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marvin_callback
      @marvin_callback = MarvinCallback.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def marvin_callback_params
      params.permit(:guid, :timestamp)
    end
end
