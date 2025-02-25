class Api::MoviesController < ApplicationController
    before_action :set_movie, only: [:show, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show] # Public access for index & show
  
    # GET /movies (public, paginated)
    def index
      movies = Movie.page(params[:page]).per(20) # Pagination
      render json: movies
    end
  
    # GET /movies/:id (public)
    def show
      render json: @movie
    end
  
    # POST /movies (authenticated)
    def create
      movie = Movie.new(movie_params)
      if movie.save
        render json: movie, status: :created
      else
        render json: { errors: movie.errors }, status: :unprocessable_entity
      end
    end
  
    # PUT/PATCH /movies/:id (authenticated)
    def update
      if @movie.update(movie_params)
        render json: @movie
      else
        render json: { errors: @movie.errors }, status: :unprocessable_entity
      end
    end
  
    # DELETE /movies/:id (authenticated)
    def destroy
      @movie.destroy
      head :no_content
    end
  
    private
  
    def set_movie
      @movie = Movie.find(params[:id])
    end
  
    def movie_params
      params.require(:movie).permit(:title, :director, :release_year, :genre)
    end
  end
  