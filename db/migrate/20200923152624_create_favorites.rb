class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.integer :user_id, null: false
      t.index :user_id
      t.integer :audio_id, null: false
      t.index :audio_id

      t.timestamps
    end
  end
end
