class AddInReplyToToDreamposts < ActiveRecord::Migration[5.1]
  def change
    add_column :dreamposts, :in_reply_to, :integer, null: false, default: 0
  end
end
