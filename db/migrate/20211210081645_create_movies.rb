class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title,null: false
      t.integer :category_id,null: false
      t.string :image
      t.integer :movie_id
      t.integer :review_id

      t.timestamps
    end
  end
end

