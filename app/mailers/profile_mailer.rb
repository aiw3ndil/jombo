# frozen_string_literal: true

class ProfileMailer < ApplicationMailer
  def reservation_sent
    @user = params[:user]
    @trip = params[:trip]
    @reservation = params[:reservation]
    mail(to: @trip.profile.user.email, subject: 'Han realizado una reserva para tu viaje.')
  end

  def trip_request_approved
    @trip = params[:trip]
    @reservation = params[:reservation]

    mail(to: @reservation.profile_request.user.email,
         subject: "Tu solicitud para el viaje #{@trip.destination} ha sido aprobada.")
  end

  def trip_request_refused
    @trip = params[:trip]
    @reservation = params[:reservation]

    mail(to: @reservation.profile_request.user.email,
         subject: "Tu solicitud para el viaje #{@trip.destination} ha sido rechazada.")
  end

  def trip_canceled
    @trip = params[:trip]
    @reservation = params[:reservation]

    mail(to: @reservation.profile_request.user.email,
         subject: "El usuario #{@reservation.profile.username} ha cancelado el viaje")
  end
end
