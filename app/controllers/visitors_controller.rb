class VisitorsController < ApplicationController
  def index
    @marvin_callbacks = MarvinCallback.all
  end
end
