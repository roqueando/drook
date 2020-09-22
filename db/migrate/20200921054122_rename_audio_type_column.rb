class RenameAudioTypeColumn < ActiveRecord::Migration[6.0]
  def self.up
    rename_column :audios, :type, :audio_type
  end
  
  def self.down
    # do nothing
  end
end
