class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname_kana, :lastname_kana, :firstname, :lastname, :gender, :age, :zip_code, :address, :phone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:firstname_kana, :lastname_kana, :firstname, :lastname, :gender, :age, :zip_code, :address, :phone])
  end
end
