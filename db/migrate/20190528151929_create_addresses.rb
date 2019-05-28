class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street_1, limit: 25
      t.string :street_2, limit: 25
      t.string :city, limit: 25
      t.string :state, limit: 2
      t.integer :zip_code, limit: 5
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
