# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]

    def new
      @title = t('views.registrations.new.title')
      
      build_resource({})
      resource.build_profile
      respond_with resource
    end
    
    def create
      @title = t('views.registrations.new.title')
      super
    end

    protected

    def sign_up_params
      devise_parameter_sanitizer.sanitize(:sign_up) { |user| user.permit(permitted_attributes) }
    end

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: permitted_attributes)
    end

    def permitted_attributes
      [
        :email,
        :password,
        :password_confirmation,
        :remember_me,
        :role,
        { profile_attributes: %i[first_name last_name username] }
      ]
    end
  end
end
