class AddUserIdToMicroposts < ActiveRecord::Migration
  def change
  	add_column :microposts, :user_id, :integer
  end
  add_index :microposts, [:user_id, :created_at]
end
