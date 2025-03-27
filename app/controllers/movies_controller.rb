class MoviesController < ApplicationController
    before_action :doorkeeper_authorize!, except: [:index, :show]
    before_action :set_movie, only: [:show, :update, :destroy]
    before_action :authenticate_user_with_token!, only: [:create, :update, :destroy]
  
    # GET /movies (Public)
    def index
        movies = Movie.page(params[:page]).per(20)
        render json: movies
    end
      
  
    # GET /movies/:id (Public)
    def show
      render json: @movie
    end
  
    # POST /movies (Requires Authentication)
    def create
      movie = Movie.new(movie_params)
      if movie.save
        render json: movie, status: :created
      else
        render json: { errors: movie.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # PUT /movies/:id (Requires Authentication)
    def update
      if @movie.update(movie_params)
        render json: @movie
      else
        render json: { errors: @movie.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # DELETE /movies/:id (Requires Authentication)
    def destroy
      @movie.destroy
      head :no_content
    end
  
    private
  
    def set_movie
      @movie = Movie.find_by(id: params[:id])
      render json: { error: "Movie not found" }, status: :not_found unless @movie
    end
  
    def movie_params
      params.require(:movie).permit(:show_id, :movie_type, :title, :director, :cast, 
                                    :country, :date_added, :release_year, :rating, 
                                    :duration, :listed_in, :description)
    end
  end
  