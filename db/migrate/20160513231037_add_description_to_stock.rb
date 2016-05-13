class AddDescriptionToStock < ActiveRecord::Migration[5.0]
  def change
    add_column :stocks, :description, :string
  end
end
