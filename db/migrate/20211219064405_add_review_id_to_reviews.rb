class AddReviewIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :review_id, :integer
  end
end
