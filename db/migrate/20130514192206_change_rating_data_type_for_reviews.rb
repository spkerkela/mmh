class ChangeRatingDataTypeForReviews < ActiveRecord::Migration
  def up
  	change_table :reviews do |t|
  		t.change :rating, :integer
  	end
  end

  def down
  	change_table :reviews do |t|
  		t.change :rating, :float
  	end
  end
end
