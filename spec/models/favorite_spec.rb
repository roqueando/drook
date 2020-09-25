require 'rails_helper'

describe Favorite, type: :model do
  let(:user) do
    User.create(name: 'test', email: 'test@gmail.com', password: '123')
  end
  let(:audio) do
    Audio.create(
      title: "audio test",
      description: 'audio description',
      audio_type: 'audiodrama',
      user_id: user.id
    )
  end

  it 'should create a favorite' do
    favorite = Favorite.create(user_id: user.id, audio_id: audio.id)
    expect(favorite).not_to be_nil
  end
end
