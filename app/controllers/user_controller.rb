class UserController < ApplicationController
  def profile
    @user = User.find(params[:id])
    render "user/profile", layout: "app"
  end

  def update_profile
    @user = User.find(params[:id])
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    if @user.save
      redirect_to "/user/profile/#{@user.id}", notice: 'Perfil atualizado com sucesso'
    else
      redirect_to "/user/profile/#{@user.id}", alert: 'Nao foi possivel atualizar seu perfil'
    end
  end
end
