class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, limit: 50
      t.integer :publication_date, limit: 4
      t.text :description
      t.float :price
      t.integer :author_id
      t.integer :book_type_id

      t.timestamps
    end
  end
end
