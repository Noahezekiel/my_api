namespace :import do
    desc "Import movies from CSV file"
    task movies: :environment do
      require 'csv'
  
      file_path = Rails.root.join('db/movies.csv')
  
      if !File.exist?(file_path)
        puts "❌ CSV file not found at #{file_path}"
        exit
      end
  
      puts "📥 Importing movies from CSV..."
      
      CSV.foreach(file_path, headers: true) do |row|
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
    end
  end
  