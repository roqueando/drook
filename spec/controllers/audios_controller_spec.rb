require 'rails_helper'

describe AudiosController, type: :controller do
  let :error_favorite_message { "Nao foi possivel adicionar este audio aos favoritos" }

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

  it 'favorite an audio' do
    post :create, params: audio_params
    expect(Audio.last).not_to be_nil

    post :add_favorite, params: {
      audio_id: Audio.last.id,
    } 

    expect(Favorite.last).not_to be_nil
    expect(Favorite.last.audio_id).to eq(Audio.last.id)
    expect(response.body).to eq({message: "Audio adicionado aos favoritos!"}.to_json)
  end

  it 'can not favorite two times' do
    post :create, params: audio_params
    favorite_params = {
      audio_id: Audio.last.id,
    }

    post :add_favorite, params: favorite_params 
    post :add_favorite, params: favorite_params 

    favorites = Favorite.all
    expect(favorites.count).to eq(1)
    expect(response.body).to eq({message: error_favorite_message}.to_json)
  end
end
