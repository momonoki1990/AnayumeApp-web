class AddLikesCountToDreamposts < ActiveRecord::Migration[5.1]
  def change
    add_column :dreamposts, :likes_count, :integer, null: false, default: 0
  end
end