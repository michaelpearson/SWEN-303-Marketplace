class AddCategoryToStock < ActiveRecord::Migration[5.0]
  def change
    add_column :stocks, :category, :string, default: "Misc"
  end
end
