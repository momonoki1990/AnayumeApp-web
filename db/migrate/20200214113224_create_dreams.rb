class CreateDreams < ActiveRecord::Migration[5.1]
  def change
    create_table :dreams do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :dreams, [:user_id, :created_at]
  end
end
