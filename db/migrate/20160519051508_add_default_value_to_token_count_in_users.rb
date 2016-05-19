class AddDefaultValueToTokenCountInUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :token_count, :integer, :default => 0
  end
end
