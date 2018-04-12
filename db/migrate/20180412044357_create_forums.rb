class CreateForums < ActiveRecord::Migration[5.1]
  def change
    create_table :forums do |t|
      t.string :name
      t.string :description
      t.string :image_url
      t.boolean :disabled
      t.timestamps
    end
  end
end
