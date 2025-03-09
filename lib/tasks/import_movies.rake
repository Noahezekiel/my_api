require 'csv'

namespace :import do
  desc "Import movies from a CSV file"
  task movies: :environment do
    file_path = Rails.root.join('db', 'movies.csv')

    CSV.foreach(file_path, headers: true) do |row|
      Movie.create!(
        show_id: row['show_id'],
        movie_type: row['movie_type'],
        title: row['title'],
        director: row['director'],
        cast: row['cast'],
        country: row['country'],
        date_added: row['date_added'].present? ? Date.parse(row['date_added']) : nil,
        release_year: row['release_year'].to_i,
        rating: row['rating'],
        duration: row['duration'],
        listed_in: row['listed_in'],
        description: row['description']
      )
    end

    puts "Movies imported successfully!"
  end
end
