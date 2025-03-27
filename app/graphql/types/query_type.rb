module Types
  class QueryType < Types::BaseObject
    # Fetch paginated movies
    field :movies, [Types::MovieType], null: false do
      argument :page, Integer, required: false, default_value: 1
    end

    def movies(page:)
      Movie.paginate(page: page, per_page: 20)
    end

    # Fetch a single movie by any field
    field :movie, Types::MovieType, null: true do
      argument :show_id, String, required: false
      argument :movie_type, String, required: false
      argument :title, String, required: false
      argument :director, String, required: false
      argument :cast, String, required: false
      argument :country, String, required: false
      argument :date_added, String, required: false
      argument :release_year, Integer, required: false
      argument :rating, String, required: false
      argument :duration, String, required: false
      argument :listed_in, String, required: false
      argument :description, String, required: false
    end

    def movie(**filters)
      Movie.find_by(filters.compact) # Removes nil values and searches by the given field
    end
  end
end
