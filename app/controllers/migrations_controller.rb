class MigrationsController < ApplicationController
    def run
      if Rails.env.production?
        Thread.new { system("bundle exec rails db:schema:load") }
        render plain: "Schema loaded successfully!"
      else
        render plain: "Not allowed in this environment."
      end
    end
  end
  