class ApplicationController < ActionController::Base
  before_filter :set_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set_user  # Se pone a disposición los datos del usuario que ha ingresado al sistema
    if user_signed_in?
      @user = current_user
      @customer = Customer.find(@user.customer_id)
    end 
  end

  # def after_sign_in_path_for(resource)
  #   dashboard_index_path
  # end

  # before_action :configure_devise_permitted_parameters, if: :devise_controller?
  
  # before_filter :authenticate_user!

  # protected
  # def configure_devise_permitted_parameters
  # 	registration_params = [:name, :address, :country, :email, :password, :password_confirmation]

  # 	if params[:action] == 'update'
  # 		devise_parameter_sanitizer.for(:account_update) { 
  # 			|u| u.permit(registration_params << :current_password)
  # 		}
  # 	elsif params[:action] == 'create'
  # 		devise_parameter_sanitizer.for(:sign_up) { 
  # 			|u| u.permit(registration_params) 
  # 		}
  # 	end
  # end

end
