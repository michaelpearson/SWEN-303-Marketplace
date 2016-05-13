class RemoveQuantityFromStock < ActiveRecord::Migration[5.0]
  def change
    remove_column :stocks, :price
  end
end
