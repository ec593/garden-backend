class SeedPacketsController < ApplicationController
    before_action :set_seed_packet, only: [:show, :update, :destroy]

  # GET /seed_packets
  def index
    @seed_packet = SeedPacket.all
    render json: @seed_packet
  end

  # GET /seed_packets/:id
  def show
    render json: @seed_packet
  end

  # POST /seed_packets
  def create
    @seed_packet = SeedPacket.new(seed_packet_params)

    if @seed_packet.save
      render json: @seed_packet, status: :created
    else
      render json: @seed_packet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /seed_packets/:id
  def update
    if @seed_packet.update(seed_packet_params)
      render json: @seed_packet
    else
      render json: @seed_packet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /seed_packets/:id
  def destroy
    @seed_packet.destroy
    head :no_content
  end

  private

  def set_seed_packet
    @seed_packet = SeedPacket.find(params[:id])
  end

  def seed_packet_params
    params.permit(:id, :seed_type, :name, :company, :year, :notes, :isEmpty)
  end
end
