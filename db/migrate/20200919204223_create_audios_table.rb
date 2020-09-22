class CreateAudiosTable < ActiveRecord::Migration[6.0]
  def change
    create_table :audio do |t|
      t.string :title, null: false
      t.string :path, null: false
      t.string :type, null: false
      t.text :description, null: false
      t.integer :user_id
      t.index :user_id, null: false

      t.timestamps
    end
  end
end
