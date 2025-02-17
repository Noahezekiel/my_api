require 'csv'

csv_file = Rails.root.join('db', 'volcanoes.csv')

CSV.foreach(csv_file, headers: true) do |row|
  Volcano.find_or_create_by(
    name: row['Name'],
    location: row['Location'],
    country: row['Country'],
    latitude: row['Latitude'].to_f,
    longitude: row['Longitude'].to_f,
    elevation: row['Elevation (m)'].to_i,  # Make sure column name matches exactly!
    volcano_type: row['Type'],
    vei: row['VEI'].to_i,  # Volcanic Explosivity Index (VEI)
    deaths: row['Deaths'].to_i,
    injuries: row['Injuries'].to_i,
    damage: row['Damage ($Mil)'].to_f,
    houses_destroyed: row['Houses Destroyed'].to_i,
    total_deaths: row['Total Deaths'].to_i
  )
end

puts "Seeded #{Volcano.count} volcanoes!"
