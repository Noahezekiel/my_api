class CreateMovies < ActiveRecord::Migration[8.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.integer :release_year
      t.string :genre
      t.string :director
      t.integer :rating

      t.timestamps
    end
  end
end
