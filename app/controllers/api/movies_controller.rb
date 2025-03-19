class Api::MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :update, :destroy]
  before_action :doorkeeper_authorize!, only: [:create, :update, :destroy]

  # GET /movies (public, no cache)
  def index
    page = params[:page] || 1 # Default to page 1 if not provided
    @movies = Movie.page(page).per(20)

    render json: {
      movies: @movies,
      pagination: {
        current_page: @movies.current_page,
        total_pages: @movies.total_pages,
        total_entries: @movies.total_count
      }
    }
  rescue => e
    Rails.logger.error("Error in MoviesController#index: #{e.message}")
    render json: { error: e.message }, status: 500
  end

  # GET /movies/:id (public, no cache)
  def show
    render json: @movie
  end

  # POST /movies (authenticated, no cache)
  def create
    movie = Movie.new(movie_params)
    if movie.save
      render json: movie, status: :created
    else
      render json: { errors: movie.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /movies/:id (authenticated, no cache)
  def update
    if @movie.update(movie_params)
      render json: @movie
    else
      render json: { errors: @movie.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /movies/:id (authenticated, no cache)
  def destroy
    @movie.destroy
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