class MigrationsController < ApplicationController
    def run
      if Rails.env.production?
        system('rails db:migrate')
        render plain: "Migrations ran successfully!"
      else
        render plain: "Not allowed in this environment."
      end
    end
  end
  