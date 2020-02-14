class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.references :dream, foreign_key: true

      t.timestamps
    end
    add_index :likes, [:user_id, :dream_id]
  end
end
