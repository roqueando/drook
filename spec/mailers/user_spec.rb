require "rails_helper"

describe UserMailer, type: :mailer do
  let(:subject_text) { "Bem vindo ao drook!" }
  let(:user_params) do
    {
      email: 'test@gmail.com',
      name: 'test',
      password: '123'
    }
  end
  let(:mail) do
    user = User.create(user_params)
    described_class.with(user: user)
      .welcome_mail
      .deliver_now
  end

  it 'render subject' do
    expect(mail.subject).to eq(subject_text)
  end
end
