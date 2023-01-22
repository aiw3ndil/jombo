# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    if user_signed_in?
      @title = 'Viajes'
      @trips = Trip.all
      render "dashboard"
    else
      @title = '¡Bienvenido a jombo!'
      render "index"
    end
  end

  def dashboard
    @title = 'Viajes'
    @trips = Trip.all
  end
end
