class ApplicationController < ActionController::API
    before_action :skip_flash
    before_action :set_current_user
  
    private
  
    def skip_flash
      flash.clear if respond_to?(:flash)
    end
  
    def set_current_user
      return unless doorkeeper_token
      @current_user ||= User.find_by(id: doorkeeper_token.resource_owner_id)
    end
  
    def authenticate_user_with_token!
      unless @current_user
        render json: { error: "Unauthorized: Invalid or expired token" }, status: :unauthorized
      end
    end
  end
  