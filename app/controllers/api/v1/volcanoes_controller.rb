class Api::V1::VolcanoesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

  def index
    @volcanoes = Volcano.page(params[:page]).per(20)
    render json: @volcanoes
  end

  def show
    render json: Volcano.find(params[:id])
  end

  def create
    @volcano = Volcano.new(volcano_params)
    if @volcano.save
      render json: @volcano, status: :created
    else
      render json: @volcano.errors, status: :unprocessable_entity
    end
  end

  def update
    @volcano = Volcano.find(params[:id])
    if @volcano.update(volcano_params)
      render json: @volcano
    else
      render json: @volcano.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @volcano = Volcano.find(params[:id])
    @volcano.destroy
    head :no_content
  end

  private

  def volcano_params
    params.require(:volcano).permit(:name, :location, :last_eruption)
  end
end
