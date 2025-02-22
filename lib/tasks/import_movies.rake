require 'csv'

namespace :movies do
    desc "Import movies from CSV file"
    task import: :environment do
      require 'csv'
  
      file_path = Rails.root.join('db', 'movies.csv')
  
      CSV.foreach(file_path, headers: true) do |row|
        Movie.create!(
          show_id: row['show_id'],
          movie_type: row['movie_type'].presence || "Unknown",
          title: row['title'],
          director: row['director'],
          cast: row['cast'],
          country: row['country'],
          date_added: row['date_added'],
          release_year: row['release_year'],
          rating: row['rating'].presence || "Unknown",
          duration: row['duration'].presence || "Unknown",
          listed_in: row['listed_in'],
          description: row['description']
        )
      end
    end
  end
  