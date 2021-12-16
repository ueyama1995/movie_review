class AddTitleToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :title, :string
    add_column :reviews, :review, :text
    add_column :reviews, :comment, :text
  end
end
