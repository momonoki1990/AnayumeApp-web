class AddAddressLatitudeLongitudeToDreamposts < ActiveRecord::Migration[5.2]
  def change
    add_column :dreamposts, :address, :string
    add_column :dreamposts, :latitude, :float
    add_column :dreamposts, :longitude, :float
  end
end
