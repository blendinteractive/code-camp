class SessionsController < ApplicationController
  # /sessions
  def index
    @sessions = Session.all
  end
  # /sessions/:id
  def show
    @session = Session.find(params[:id])
  end
end
