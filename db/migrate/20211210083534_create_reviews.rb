class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :review_id
      t.text :comment,null: false
      t.float :value,null: false
      t.string :title,null: false
      t.integer :category,null: false
      t.integer :genre,null: false

      t.timestamps
    end
  end
end
