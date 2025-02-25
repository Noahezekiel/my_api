require 'csv'

csv_file = Rails.root.join('db/seeds/movies.csv')

CSV.foreach(csv_file, headers: true) do |row|
  Movie.create!(
    show_id: row['show_id'],
    movie_type: row['movie_type'], 
    title: row['title'], 
    director: row['director'], 
    cast: row['cast'], 
    country: row['country'], 
    date_added: row['date_added'], 
    release_year: row['release_year'], 
    rating: row['rating'], 
    duration: row['duration'], 
    listed_in: row['listed_in'], 
    description: row['description']
  )
end

puts "✅ Movies imported successfully!"
