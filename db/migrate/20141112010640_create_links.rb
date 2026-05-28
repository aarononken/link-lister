class CreateLinks < ActiveRecord::Migration[8.0]
  def change
    create_table :links do |t|
      t.integer :user_id
      t.text :url
      t.string :title

      t.timestamps null: false
    end
  end
end
