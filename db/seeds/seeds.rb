10.times do |i|
    Movie.create!(
      title: "Movie #{i + 1}",
      description: "This is a test movie.",
      release_date: Date.today - rand(1000).days
    )
  end
  