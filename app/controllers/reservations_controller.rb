# frozen_string_literal: true

class ReservationsController < ApplicationController
  before_action :get_trip
  before_action :set_reservation, only: %i[show edit update destroy]
  before_action :set_title
  load_and_authorize_resource

  # GET /reservations or /reservations.json
  def index
    @reservations = @trip.reservations
  end

  # GET /reservations/1 or /reservations/1.json
  def show; end

  # GET /reservations/new
  def new
    @reservation = @trip.reservations.build
  end

  # GET /reservations/1/edit
  def edit; end

  # POST /reservations or /reservations.json
  def create
    @reservation = @trip.reservations.build(reservation_params)
    @reservation.profile_id = @trip.profile.id
    @reservation.profile_request_id = current_user.profile.id
    @reservation.trip_id = @trip.id
    @reservation.status = 'sent'

    respond_to do |format|
      if @reservation.save
        Notification.create(message: "El usuario #{current_user.profile.username} ha solicitado una reserva",
                            url: trip_reservations_path(@trip), profile_id: @trip.profile_id)

        ProfileMailer.with(user: current_user, trip: @trip, reservation: @reservation).reservation_sent.deliver_now
        format.html { redirect_to trip_url(@trip), notice: 'Reserva enviada.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update
    case reservation_params[:status]
    when 'approved'
      Notification.create(message: "Tu solicitud para el viaje #{@trip.destination} ha sido aceptada.",
                          url: trip_reservations_path(@trip), profile_id: @reservation.profile_request_id)

      ProfileMailer.with(trip: @trip, reservation: @reservation).trip_request_approved.deliver_now
    when 'refused'
      Notification.create(message: "Tu solicitud para el viaje #{@trip.destination} ha sido rechazada.",
                          url: trip_reservations_path(@trip), profile_id: @reservation.profile_request_id)

      ProfileMailer.with(trip: @trip, reservation: @reservation).trip_request_refused.deliver_now
    end

    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to trip_url(@trip), notice: 'Reserva actualizada.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
    @reservation.destroy

    respond_to do |format|
      format.html { redirect_to trip_reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_title
    @title = 'Reservas'
  end

  def get_trip
    @trip = Trip.find(params[:trip_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:profile_id, :trip_id, :status)
  end
end
