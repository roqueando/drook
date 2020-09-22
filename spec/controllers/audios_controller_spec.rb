require 'rails_helper'

describe AudiosController, type: :controller do
  let :audio_params do
    user = User.create(name: 'test', email: "test@gmail.com", password: '123')
    session[:user_id] = user.id
    {
      audio: {
        title: 'audio test',
        description: 'audio testing',
        audio_type: 'audiodrama',
        path: fixture_file_upload("audio.mp3", "audio/mp3"),
      }
    }
  end

  it 'create an audio' do
    post :create, params: audio_params
    expect(Audio.last).not_to be_nil
    expect(Audio.last.title).to eq('audio test')
    expect(Audio.last.path.presence).to be_truthy
  end
end
