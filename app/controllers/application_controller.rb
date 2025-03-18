class ApplicationController < ActionController::API
    before_action :seed_db_if_empty
  
    private
  
    def seed_db_if_empty
      if Movie.count.zero?
        Rails.logger.info "🌱 Seeding database..."
        require Rails.root.join("db/seeds.rb")
      end
    end
  end
  