class AddTokenCountToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :token_count, :integer
  end
end
