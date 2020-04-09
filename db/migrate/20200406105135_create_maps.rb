class CreateMaps < ActiveRecord::Migration[5.1]
  def change
    create_table :maps do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.text :title
      t.text :comment
      t.string :picture
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end