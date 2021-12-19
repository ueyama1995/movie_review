class RemoveReviewIdFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :review_id, :integer
  end
end
