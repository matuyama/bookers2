class ApplicationController < ActionController::Base
before_action :authenticate_user!, except: [:top]
 before_action :configure_permitted_parameters, if: :devise_controller?

   def after_sign_in_path_for(resource)
     user_path(resource)
   end

   def after_sing_out_path_for(resource)
     about_path
   end




  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
end
