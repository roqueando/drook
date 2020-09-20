class AuthController < ApplicationController

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

  def authenticate
    @user = User.find_by(email: params[:email].downcase)
    if(@user and @user.authenticate(params[:password])) 
      sign_in @user
      redirect_to '/app'
    else
      redirect_to '/', alert: "Usuario e/ou senha incorreto(s)"
    end
  end

  private
  def user_params
        params.require(:user).permit(:name, :email, :password)
  end
end
