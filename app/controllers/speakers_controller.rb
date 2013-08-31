class SpeakersController < ApplicationController
  # /speakers
  def index
    @speakers = Speaker.all
  end
  # # /speakers/:id
  # def show
  #   @speaker = Speaker.find(:id)
  # end
end
