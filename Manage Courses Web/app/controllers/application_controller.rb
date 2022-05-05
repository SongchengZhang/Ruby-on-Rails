class ApplicationController < ActionController::Base
    include Pagy::Backend
    def index
        render "site/index"
    end
    #Set roles options when signing up
    before_action :configure_permitted_parameters, if: :devise_controller?

    private
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
    end



end
