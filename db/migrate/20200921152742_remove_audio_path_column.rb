class RemoveAudioPathColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :audios, :path
  end
end
