class Api::MoviesController < ApplicationController
    before_action :set_movie, only: [:show, :update, :destroy]
    before_action :doorkeeper_authorize!, only: [:create, :update, :destroy]
    

    # GET /movies (public, cached)
    def index
      movies = Rails.cache.fetch("movies_page_#{params[:page] || 1}", expires_in: 30.minutes) do
        Movie.page(params[:page]).per(20).to_a
      end
      render json: movies
    end
  
    # GET /movies/:id (public, cached)
    def show
      movie = Rails.cache.fetch("movie_#{params[:id]}", expires_in: 30.minutes) do
        @movie
      end
      render json: movie
    end
  
    # POST /movies (authenticated, clears cache)
    def create
      movie = Movie.new(movie_params)
      if movie.save
        Rails.cache.delete_matched("movies_page_*") # Clear cache for index
        render json: movie, status: :created
      else
        render json: { errors: movie.errors }, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /movies/:id (authenticated, clears cache)
    def update
      if @movie.update(movie_params)
        Rails.cache.delete("movie_#{params[:id]}")
        render json: @movie
      else
        render json: { errors: @movie.errors }, status: :unprocessable_entity
      end
    end
  
    # DELETE /movies/:id (authenticated, clears cache)
    def destroy
      @movie.destroy
      Rails.cache.delete("movie_#{params[:id]}")
      head :no_content
    end
  
    private

    def current_user
      @current_user ||= User.find_by(id: doorkeeper_token.resource_owner_id) if doorkeeper_token
    end
    
    def set_movie
      @movie = Movie.find(params[:id])
    end
  
    def movie_params
      params.require(:movie).permit(:show_id, :movie_type, :title, :director, :cast, :country, :date_added, :release_year, :rating, :duration, :listed_in, :description)
    end
  end
