class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.integer :capacity
      t.datetime :open_date
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
