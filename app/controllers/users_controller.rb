class UsersController < ApplicationController
    before_action :authenticate_user_with_token!
    before_action :set_user, only: [:update, :destroy]
    before_action :authorize_admin, only: [:index] # Only admins can see all users
    before_action :authorize_user_or_admin, only: [:update, :destroy] # Users can edit/delete their own account
  
    # GET /users - Fetch all users (Admin only)
    def index
      users = User.all
      render json: users, status: :ok
    end
  
    # PUT /users/:id - Update user
    def update
      if @user.update(user_params)
        render json: { message: "User updated successfully", user: @user }, status: :ok
      else
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # DELETE /users/:id - Delete user
    def destroy
      @user.destroy
      render json: { message: "User deleted successfully" }, status: :ok
    end
  
    private
  
    def set_user
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: "User not found" }, status: :not_found
    end
  
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  
    # ✅ Authenticate using Doorkeeper Token
    def authenticate_user_with_token!
      token = Doorkeeper::AccessToken.find_by(token: request.headers["Authorization"]&.split(" ")&.last)
      
      if token.nil? || token.revoked? || token.expired?
        render json: { error: "Token is invalid or expired" }, status: :unauthorized
        return
      end
      
      @current_user = User.find_by(id: token.resource_owner_id)
      unless @current_user
        render json: { error: "User not found" }, status: :unauthorized
      end
    end
  
    # ✅ Ensure only admins can fetch all users
    def authorize_admin
      unless @current_user&.admin?
        render json: { error: "Unauthorized: Admin access required" }, status: :forbidden
      end
    end
  
    # 🔒 Users can only update/delete their own account (unless admin)
    def authorize_user_or_admin
      unless @current_user&.admin? || @current_user == @user
        render json: { error: "Unauthorized: You can only modify your own account" }, status: :forbidden
      end
    end
  end
  