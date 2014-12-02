class DashboardController < ApplicationController
	before_filter :authenticate_user!, only: [:edit, :update, :destroy, :new, :create]

	def index # Función que pretende ser un enrutador dependiendo del rol del usuario		
		redirect_to custAdmin_dashboard_index_path
	end

	def custAdmin
		@user = current_user
	end
end
