# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
      @user = User.create_from_provider_data(request.env['omniauth.auth'])
      if @user.persisted?
        sign_in_and_redirect @user
        set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
      else
        flash[:error]='Ha habido un problema iniciando sesión desde Google. Por favor registrate o inténtalo de nuevo.'
        redirect_to new_user_session_path
      end
    end

    def failure
      redirect_to root_path
    end
  end
end
