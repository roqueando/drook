class UserMailer < ApplicationMailer
  def welcome_mail
    @user = params[:user]
    @url = 'http://localhost:3000/'
    mail(to: @user.email, subject: "Bem vindo ao drook!")
  end
end
