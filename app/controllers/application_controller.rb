# frozen_string_literal: true

class ApplicationController < ActionController::Base
  layout :layout_by_resource
  before_action :switch_locale

  private

  def layout_by_resource
    devise_controller? ? 'session' : 'application'
  end
  
  def switch_locale
    I18n.locale = params[:locale] || :es
  end
end
