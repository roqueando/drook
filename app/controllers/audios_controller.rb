class AudiosController < ApplicationController
  before_action :set_user, only: [:index]
  def index
    @audios = Audio.all
  end

  private
  def set_user
    @user = User.find(session[:user_id])
  end
end
