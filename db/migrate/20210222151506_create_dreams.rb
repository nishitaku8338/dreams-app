class CreateDreams < ActiveRecord::Migration[6.0]
  def change
    create_table :dreams do |t|
      t.references :user,  foreign_key: true
      t.string :title,     null: false
      t.text :body,        null: false
      t.string :image_id,  null: false

      t.timestamps
    end
  end
end
