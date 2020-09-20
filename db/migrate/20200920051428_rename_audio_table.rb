class RenameAudioTable < ActiveRecord::Migration[6.0]
  def self.up
    rename_table :audio, :audios
  end

  def self.down
    rename_table :audios, :audio
  end
end
