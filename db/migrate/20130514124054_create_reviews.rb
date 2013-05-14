class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :movie_id
      t.integer :user_id
      t.float :rating
      t.text :content

      t.timestamps
    end
    add_index :reviews, :movie_id
    add_index :reviews, :user_id
    add_index :reviews, :rating
    add_index :reviews, [:movie_id, :user_id], unique: true
  end
end
