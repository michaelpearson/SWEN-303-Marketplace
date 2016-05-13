class ChangePriceFormatInStock < ActiveRecord::Migration[5.0]
  def up
    change_column :stocks, :price, :integer
  end

  def down
    change_column :stocks, :price, :decimal
  end
end
