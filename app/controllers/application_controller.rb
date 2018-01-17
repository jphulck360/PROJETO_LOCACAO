class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # método utilizado para adicionar parâmetros para gravação da gem 'devise'
  def configure_permitted_parameters
  	added_attrs = [:email]
  	devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  	devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

end
