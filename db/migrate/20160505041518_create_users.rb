class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.text :realname
      t.text :password

      t.timestamps
    end
  end
end
