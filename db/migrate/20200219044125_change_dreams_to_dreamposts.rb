class ChangeDreamsToDreamposts < ActiveRecord::Migration[5.1]
  def change
    rename_table :dreams, :dreamposts
  end
end
