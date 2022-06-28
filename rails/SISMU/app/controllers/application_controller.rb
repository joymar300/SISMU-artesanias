class ApplicationController < ActionController::Base
    include Pundit::Authorization
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
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

  
    private

    def user_not_authorized
        flash[:alert] = "No estás autorizado para ingresar."
        redirect_back(fallback_location: root_path)
    end

end
