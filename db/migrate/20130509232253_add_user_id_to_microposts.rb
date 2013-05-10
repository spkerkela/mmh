class AddUserIdToMicroposts < ActiveRecord::Migration
  def change
  	add_column :microposts, :user_id, :integer
    add_index :microposts, [:user_id, :created_at]
  end
end
