class RenameTypeColumnInMovies < ActiveRecord::Migration[6.1]
  def change
    rename_column :movies, :type, :movie_type
  end
end
