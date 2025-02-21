class Movie < ApplicationRecord
    validates :show_id, :movie_type, :title, :release_year, :rating, :duration, presence: true
  
    
    
    # # Uniqueness Constraint
    # validates :show_id, uniqueness: true
  
    # # Ensuring `release_year` is within a valid range
    # validates :release_year, numericality: { only_integer: true, greater_than: 1800, less_than_or_equal_to: Date.today.year }
  
    # # Limiting the length of `title` and `director` to prevent overly long values
    # validates :title, length: { maximum: 255 }
    # validates :director, length: { maximum: 255 }, allow_blank: true
  
    # # Restricting `rating` to a specific set of values (assuming standard ratings like "PG", "R", etc.)
    # VALID_RATINGS = %w[G PG PG-13 R NC-17 TV-Y TV-Y7 TV-G TV-PG TV-14 TV-MA]
    # validates :rating, inclusion: { in: VALID_RATINGS, message: "%{value} is not a valid rating" }
  
    # # Ensure duration follows a specific format (e.g., "120 min" or "2 Seasons")
    # validates :duration, format: { with: /\A\d+\s(min|Seasons?)\z/, message: "must be in 'minutes' or 'seasons' format" }
  end
  