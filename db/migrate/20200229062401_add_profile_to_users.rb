class AddProfileToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :profile, :text
    add_index :users, :profile
  end
end
