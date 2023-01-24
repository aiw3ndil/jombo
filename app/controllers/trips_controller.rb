# frozen_string_literal: true

class TripsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_trip, only: %i[show edit update destroy]
  before_action :set_title

  # GET /trips or /trips.json
  def index
    @trips = Trip.all
  end

  # GET /trips/1 or /trips/1.json
  def show
  end

  # GET /trips/new
  def new
    if current_user.profile.vehicle.present?
      @title = "Viajes"
      @trip = Trip.new
      @trip.stops.build
    else
      redirect_to new_vehicle_path, flash: { notice: "Primero debes añadir un vehículo" }
    end
  end

  # GET /trips/1/edit
  def edit
    @trip.stops.build
  end

  # POST /trips or /trips.json
  def create
    @trip = Trip.new(trip_params)
    @trip.profile_id = current_user.id

    respond_to do |format|
      if @trip.save
        format.html { redirect_to root_url, notice: 'El viaje ha sido creado.' }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1 or /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to trip_url(@trip), notice: 'El viaje se ha actualizado.' }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1 or /trips/1.json
  def destroy
    @trip.destroy

    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'El viaje ha sido eliminado.' }
      format.json { head :no_content }
    end
  end

  private

  def set_title
    @title = "Viajes"
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_trip
    @trip = Trip.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def trip_params
    params.require(:trip).permit(:start_date, :source, :destination, :seats_available, stops_attributes: [:id, :description, :duration, :place])
  end
end
