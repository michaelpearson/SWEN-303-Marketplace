class RenameStockQuanityToPrice < ActiveRecord::Migration[5.0]
  def change
    rename_column :stocks, :quantity, :price
  end
end
