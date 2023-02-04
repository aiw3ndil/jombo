# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    if user_signed_in?
      @title = 'Próximos viajes'
      @trips = Trip.coming
      render 'dashboard'
    else
      @title = '¡Bienvenido a jombo!'
      render 'index'
    end
  end

  def dashboard; end

  def privacy; end

  def contact; end
end
