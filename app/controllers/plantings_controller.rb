class PlantingsController < ApplicationController
    before_action :set_planting, only: [:show, :update, :destroy]

  # GET /plantings
  def index
    if params[:date].present? 
      date = Time.parse(params[:date])
      @planting = Planting.where("start <= ? AND (end IS NULL OR end > ?)", date.beginning_of_day, date.end_of_day).includes(square: :planting)
    else
      @planting = Planting.includes(square: :planting)
    end  
    render json: @planting
  end

  # GET /plantings/:id
  def show
    @planting = Planting.includes(:seed_packet).find(params[:id])
    render json: @planting.as_json(include: :seed_packet)
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
    params.permit(:id, :square_id, :seed_packet_id, :num_sites, :seeds_per_site, :num_squares, :notes, :start, :end)
  end
end
