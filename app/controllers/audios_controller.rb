class AudiosController < ApplicationController
  include ActionController::Live

  before_action :set_user, only: [:index]
  layout "app"

  def index
    @audios = Audio.all.order(:created_at)
    @audios = Kaminari
      .paginate_array(@audios)
      .page(params[:page])
      .per(6)
  end

  def show
    @audios = Audio.where(user_id: session[:user_id])
    @audio = Audio.new
    @types = [
      ['Escolha o tipo de audio', ''],
      ['Audiodrama', 'audiodrama'],
      ['Audiobook', 'audiobook']
    ]
  end

  def create
    @audio = Audio.create(audio_params)
    @audio.path.attach(audio_params[:path])

    @audio.user_id = session[:user_id]
    respond_to do |format|
      if @audio.save!
        format.html do
          redirect_to :audios, notice: 'Audio criado com sucesso!'
        end
      else
        puts 'audio not saved'
        format.html do
          redirect_to :action => 'show', alert: 'Nao foi possivel criar o audio'
        end
      end
    end
  end

  def stream
    audio = Audio.find(params[:id])

    send_data audio.path.service.download(audio.path.key),
      type: audio.path.content_type,
      disposition: 'inline'
  end

  private
  def set_user
    @user = User.find(session[:user_id])
  end

  def audio_params
    params.require(:audio).permit(
      :title,
      :description,
      :audio_type,
      :path
    )
  end
end
