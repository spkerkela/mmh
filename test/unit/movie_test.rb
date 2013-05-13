# == Schema Information
#
# Table name: movies
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  year       :string(255)
#  rated      :string(255)
#  released   :string(255)
#  runtime    :string(255)
#  genre      :string(255)
#  director   :string(255)
#  writer     :string(255)
#  actors     :string(255)
#  plot       :text
#  imdbrating :float
#  imdbvotes  :integer
#  imdbid     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  poster     :text
#

require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
