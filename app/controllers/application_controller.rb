class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :gender, :date_of_birth, :branch])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :gender, :date_of_birth])
    end
end
