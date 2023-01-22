# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    if user_signed_in?
      @title = 'Dashboard'
      @trips = Trip.all
      render "dashboard"
    else
      @title = '¡Bienvenido a jombo!'
      render "index"
    end
  end

  def dashboard
    @title = 'Dashboard'
    @trips = Trip.all
  end
end
