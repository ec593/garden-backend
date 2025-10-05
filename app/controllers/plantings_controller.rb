class PlantingsController < ApplicationController
    before_action :set_planting, only: [:show, :update, :destroy]

  # GET /plantings
  def index
    @planting = Planting.all
    render json: @planting
  end

  # GET /plantings/:id
  def show
    render json: @planting
  end

  # POST /plantings
  def create
    @planting = Planting.new(planting_params)

    if @planting.save
      render json: @planting, status: :created
    else
      render json: @planting.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /plantings/:id
  def update
    if @planting.update(planting_params)
      render json: @planting
    else
      render json: @planting.errors, status: :unprocessable_entity
    end
  end

  # DELETE /plantings/:id
  def destroy
    @planting.destroy
    head :no_content
  end

  private

  def set_planting
    @planting = Planting.find(params[:id])
  end

  def planting_params
    params.permit(:square_id, :seed_packet_id, :num_sites, :seeds_per_site, :end)
  end
end
