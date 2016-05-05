class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.string :label
      t.decimal :price
      t.integer :quantity
      t.integer :owner_id

      t.timestamps
    end
    add_foreign_key :stocks, :users, column: :owner_id
  end
end
