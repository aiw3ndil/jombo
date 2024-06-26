# frozen_string_literal: true

class VehiclesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vehicle, only: %i[show edit update destroy]
  before_action :set_title
  load_and_authorize_resource

  # GET /vehicles/1 or /vehicles/1.json
  def show; end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
  end

  # GET /vehicles/1/edit
  def edit; end

  # POST /vehicles or /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.profile_id = current_user.id

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to vehicle_url, notice: t('controllers.vehicle.created') }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1 or /vehicles/1.json
  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to vehicle_url, notice: t('controllers.vehicle.updated') }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1 or /vehicles/1.json
  def destroy
    @vehicle.destroy

    respond_to do |format|
      format.html { redirect_to vehicle_url, notice: t('controllers.vehicle.deleted') }
      format.json { head :no_content }
    end
  end

  private

  def set_title
    @title = t('controllers.vehicle.title')
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_vehicle
    if current_user.profile.vehicle.present?
      @vehicle = current_user.profile.vehicle
    else
      redirect_to new_vehicle_path
    end
  end

  # Only allow a list of trusted parameters through.
  def vehicle_params
    params.require(:vehicle).permit(:vehicle_type, :brand, :model, :color)
  end
end
