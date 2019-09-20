class ApplicationController < ActionController::Base

	def current_cart
    if current_user.present?
      return Cart.find_or_create_by(user_id: current_user.id, is_done: false)
    end
  end
  helper_method :current_cart
   # before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?
	protected

	def configure_permitted_parameters

  	devise_parameter_sanitizer.permit(:sign_up) do |user_params|
	    user_params.permit({ roles: [] }, :email, :password, :password_confirmation,:first_name,:last_name)
	  end

	   	devise_parameter_sanitizer.permit(:account_update) do |user_params|
	   		 user_params.permit({ roles: [] }, :email, :password, :password_confirmation,:first_name,:last_name,:current_password)
	  end

  end
end
