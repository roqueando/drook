require 'rails_helper'

describe User do
  let :user_params do
    {
      name: 'teste',
      email: 'test@gmail.com',
      password: '123'
    }
  end
  it 'valid when name, email and password is filled up' do
    user = User.new(user_params)
    expect(user).to be_valid
  end
  it 'invalid when has a duplicated email' do
    user = User.create(user_params)
    second_user = User.new(user_params)
    expect(second_user).to be_invalid
  end

end
