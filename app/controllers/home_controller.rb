# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    if user_signed_in?
      @title = t('views.dashboard.title')
      @trips = Trip.coming
      render 'dashboard'
    else
      @title = t('views.home.title')
      render 'index'
    end
  end

  def dashboard; end

  def privacy; end

  def contact; end
end
