module AuthHelper
  def sign_in(user)
    session[:user_id] = user.id
    session[:user_email] = user.email
    session[:user_name] = user.name
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def block_access
    if current_user.present?
      redirect_to '/app'
    end
  end

  def logged_in?
    !current_user.nil?
  end
end
