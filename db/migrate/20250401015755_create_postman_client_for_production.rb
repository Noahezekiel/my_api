class CreatePostmanClientForProduction < ActiveRecord::Migration[YOUR_RAILS_VERSION]
  def up
    unless Doorkeeper::Application.find_by(name: 'Postman Client')
      app = Doorkeeper::Application.create!(
        name: 'Postman Client',
        redirect_uri: 'urn:ietf:wg:oauth:2.0:oob',
        scopes: ''
      )
      puts "Doorkeeper application created in production:"
      puts "  Client ID: #{app.uid}"
      puts "  Client Secret: #{app.secret}"
    end
  end

  def down
    Doorkeeper::Application.find_by(name: 'Postman Client')&.destroy
  end
end