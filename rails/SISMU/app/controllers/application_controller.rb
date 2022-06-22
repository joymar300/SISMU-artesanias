class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception
    # before_action :configure_permitted_parameters, if: :devise_controller?

    # protected

    #     def configure_permitted_parameters
    #         
    #     end
        before_action :configure_permitted_parameters, if: :devise_controller?

        protected
        
        def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up, keys: [:primernombre, :segundonombre, :primerapellido , :segundoapellido, :email, :password,:avatar])
          devise_parameter_sanitizer.permit(:account_update, keys: [:primernombre, :segundonombre, :primerapellido , :segundoapellido, :email, :password,:avatar])
        # evise_parameter_sanitizer.permit(:sign_up) { |u| u.permit() }  d
        end
end
