
Doorkeeper.configure do
  orm :active_record

  # ✅ Enable password grant flow
  grant_flows %w[password]

  # Authenticate users using email & password
  resource_owner_from_credentials do |controller|
    params = controller.params
  
    user = User.find_by(email: params[:username]&.downcase)
  
    if user&.valid_password?(params[:password])
      user
    else
      nil
    end
  end

  access_token_expires_in 9.hours
  use_refresh_token
end
