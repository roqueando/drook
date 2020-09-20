class CreateAudiosTable < ActiveRecord::Migration[6.0]
  def change
    create_table :audio do |t|
      t.string :title
      t.string :path
      t.string :type
      t.text :description
      t.integer :user_id
      t.index :user_id

      t.timestamps
    end
  end
end
