class AuthController < ApplicationController
  before_action :block_access, only: [:index, :register]

  def index
    render "auth/login"
  end

  def register
    render "auth/register"
  end

  def store
    @user = User.create(user_params)

    respond_to do |format|
      if @user.save
        format.html do
          UserMailer.with(user: @user)
            .welcome_mail
            .deliver_later
          redirect_to '/', notice: 'Usuario criado com sucesso'
        end
      else
        format.html do
          redirect_to '/register', alert: 'Nao foi possivel criar sua conta'
        end
      end
    end
  end

  def profile
    @user = User.find(params[:id])
    render "auth/profile", layout: "app"
  end

  def update_profile
    @user = User.find(params[:id])
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    if @user.save
      format.html do
        redirect_to "/user/profile/#{@user.id}", notice: 'Perfil atualizado com sucesso'
      end
    else
      format.html do
        redirect_to "/user/profile/#{@user.id}", alert: 'Nao foi possivel atualizar seu perfil'
      end
    end
  end

  def authenticate
    @user = User.find_by(email: params[:email].downcase)
    if(@user and @user.authenticate(params[:password])) 
      sign_in @user
      redirect_to '/app'
    else
      redirect_to '/', alert: "Usuario e/ou senha incorreto(s)"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/', notice: "Deslogado com sucesso"
  end

  private
  def user_params
        params.require(:user).permit(:name, :email, :password)
  end
end
