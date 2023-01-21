# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @title = '¡Bienvenido a jombo!'

    if user_signed_in?
      render "dashboard"
    else
      render "index"
    end
  end

  def dashboard
    @title = 'Dashboard'
  end
end
