class BedsController < ApplicationController
  SQUARE_SIZE_PX = 40

  before_action :set_bed, only: [:show, :update, :destroy]

  # GET /beds
  def index
    date = params[:date].present? ? Time.parse(params[:date]) : Time.current
    @beds = Bed.where("created_at <= ? AND (archived IS NULL OR archived > ?)", date, date).includes(squares: :planting)
    filter = ->(planting) {
      return false unless planting
      planting.start <= date.beginning_of_day && (planting.end.nil? || planting.end > date.end_of_day)
    }
    render json: @beds, each_serializer: BedSerializer, date_filter: filter
  end
  

  # GET /beds/:id
  def show
    render json: @bed
  end

  # POST /beds
  def create
    @bed = Bed.new(bed_params)

    if @bed.save
        cols = @bed.width / SQUARE_SIZE_PX
        rows = @bed.height / SQUARE_SIZE_PX

        squares = []

        rows.times do |y|
            cols.times do |x|
                squares << Square.new(bed: @bed, x: x, y: y)
            end
        end

        Square.import(squares)

        @bed_with_squares = Bed.includes(:squares).find(@bed.id)

        render json: @bed_with_squares.as_json(include: :squares), status: :created
    else
      render json: @bed.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /beds/:id
  def update
    if @bed.update(bed_params)
      render json: @bed
    else
      render json: @bed.errors, status: :unprocessable_entity
    end
  end

  # DELETE /beds/:id
  def destroy
    @bed.destroy
    head :no_content
  end

  private

  def set_bed
    @bed = Bed.find(params[:id])
  end

  def bed_params
    params.permit(:id, :name, :x, :y, :width, :height, :archived)
  end
end
