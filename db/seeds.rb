# require 'csv'

# CSV.foreach(Rails.root.join('db/movies.csv'), headers: true) do |row|
#   Movie.create!(
#     title: row['title'],
#     description: row['description'],
#     release_year: row['release_year']
#   )
# end

# puts "✅ Movies imported successfully!"
