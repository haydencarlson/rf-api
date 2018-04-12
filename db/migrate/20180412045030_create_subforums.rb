class CreateSubforums < ActiveRecord::Migration[5.1]
  def change
    create_table :subforums do |t|
      t.string :name
      t.references :forum, index: true
      t.boolean :disabled
      t.timestamps
    end
  end
end
