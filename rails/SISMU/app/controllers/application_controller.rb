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

            
            devise_parameter_sanitizer.permit(:sign_up, keys: [ :primernombre,:segundonombre,:primerapellido,:segundoapellido, :avatar])
            devise_parameter_sanitizer.permit(:account_update, keys: [:primernombre,:segundonombre,:primerapellido,:segundoapellido,:avatar]) 

         

        end
end
