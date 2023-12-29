class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: []) # Permitir el ingreso de nuevos input en el registro

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :photo]) # Permitir el ingreso de nuevos inputs desde editar el usuario
  end

  private 

  def set_cart 
    @cart = Cart.find(session[:cart_id]) 
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end