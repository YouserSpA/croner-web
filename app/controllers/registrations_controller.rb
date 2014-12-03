class RegistrationsController < Devise::RegistrationsController

	protected
 
  def sign_up_params
    params.require(:user).permit(:customer_id, :email, :password, :password_confirmation)
  end
 
  def account_update_params
    params.require(:user).permit(:customer_id, :email, :password, :password_confirmation, :current_password)
  end
end
