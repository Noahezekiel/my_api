Doorkeeper.configure do
  orm :active_record

  # ✅ Enable grant flows
  grant_flows %w[password client_credentials authorization_code]

  # ✅ Allow login using email instead of username
  resource_owner_from_credentials do |routes|
    user = User.find_by(email: params[:email]) # 🔥 Use email
    user if user&.valid_password?(params[:password])
  end
end
