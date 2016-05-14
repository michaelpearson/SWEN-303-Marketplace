class AddDefaultValuesToNotifications < ActiveRecord::Migration[5.0]
  def change
    change_column :notifications, :seen, :boolean, :default => false
    change_column :notifications, :pushed, :boolean, :default => false
  end
end
