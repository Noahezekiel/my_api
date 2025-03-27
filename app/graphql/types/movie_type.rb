module Types
    class MovieType < Types::BaseObject
      field :id, ID, null: false
      field :title, String, null: false
      field :description, String, null: false
      field :release_year, Integer, null: false
      field :rating, Float, null: false
    end
  end
  