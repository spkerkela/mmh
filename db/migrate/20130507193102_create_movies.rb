class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :rated
      t.string :released
      t.string :runtime
      t.string :genre
      t.string :director
      t.string :writer
      t.string :actors
      t.text :plot
      t.float :imdbrating
      t.integer :imdbvotes
      t.string :imdbid
      t.timestamps
    end
  end
end
