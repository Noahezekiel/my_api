class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :access_grants,
           class_name: 'Doorkeeper::AccessGrant',
           foreign_key: :resource_owner_id,
           dependent: :delete_all

  has_many :access_tokens,
           class_name: 'Doorkeeper::AccessToken',
           foreign_key: :resource_owner_id,
           dependent: :delete_all

  # If you have this method, modify it:
  def as_json(options = {})
  super(options.merge(
    except: [
      :encrypted_password,
      :reset_password_token,
      :reset_password_sent_at,
      :password_digest  # ✅ Properly closed array
    ]  # ← This closing bracket was missing
  ))
  end

  # If you previously added serializable_hash instead:
  def serializable_hash(options = nil)
    super(options).except('encrypted_password')
  end
end