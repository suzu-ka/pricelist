class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.string :genre
      t.text :about

      t.timestamps
    end
  end
end
