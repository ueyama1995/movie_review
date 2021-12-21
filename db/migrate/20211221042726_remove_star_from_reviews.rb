class RemoveStarFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :star, :string
  end
end
