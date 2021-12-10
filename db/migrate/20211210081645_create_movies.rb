class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.float :review
      t.string :image

      t.timestamps
    end
  end
end
