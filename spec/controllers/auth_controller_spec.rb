require 'rails_helper'

describe AuthController, type: :controller do
  let :user_params do
    {
      user: {
        name: 'teste',
        email: 'test@gmail.com',
        password: 'senha123'
      }
    }
  end
  let :login_params do
    {
      email: 'test@gmail.com',
      password: 'senha123'
    }
  end

  it 'register with user' do
    post :store, params: user_params
    expect(User.last).not_to be_nil
  end

  it 'login with a created user' do
    user = User.create(user_params[:user]) 
    post :authenticate, params: login_params
    expect(session[:user_id]).to eq(user.id)
  end
end
