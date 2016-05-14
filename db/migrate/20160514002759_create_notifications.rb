class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :stock_id
      t.string :description
      t.boolean :seen
      t.boolean :pushed
      t.string :title

      t.timestamps
    end
  end
end
