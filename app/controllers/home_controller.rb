class HomeController < ApplicationController
  before_filter :set_user

  def set_user
  	if user_signed_in?
	  	@user = current_user
	  	@customer = Customer.where(:id => @user.customer_id).first
	end
  end

  def index
  	
  end

end
