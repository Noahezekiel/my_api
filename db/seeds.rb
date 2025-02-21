# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Movie.create([
  { show_id: "s1", movie_type: "Movie", title: "Inception", director: "Christopher Nolan", cast: "Leonardo DiCaprio, Joseph Gordon-Levitt", country: "USA", date_added: "2010-07-16", release_year: 2010, rating: "PG-13", duration: "148 min", listed_in: "Sci-Fi, Thriller", description: "A thief enters people's dreams to steal secrets." },
  { show_id: "s2", movie_type: "TV Show", title: "Breaking Bad", director: "Vince Gilligan", cast: "Bryan Cranston, Aaron Paul", country: "USA", date_added: "2008-01-20", release_year: 2008, rating: "TV-MA", duration: "5 Seasons", listed_in: "Crime, Drama", description: "A chemistry teacher turned drug kingpin." }
])
