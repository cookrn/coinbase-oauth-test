class User < ActiveRecord::Base
  ##
  # Validations
  #

  validates_presence_of \
    :access_token,
    :email,
    :refresh_token

  ##
  # Class Methods
  #

  def self.find_or_create_from_auth_hash( auth_hash = {} )
    auth_map = Map.for auth_hash

    email =
      auth_map.get \
        :info,
        :email

    access_token =
      auth_map.get \
        :credentials,
        :token

    refresh_token =
      auth_map.get \
        :credentials,
        :refresh_token

    if email.present? && access_token.present? && refresh_token.present?
      user = User.find_or_initialize_by :email => email

      user.access_token  = access_token
      user.refresh_token = refresh_token

      if user.valid? and user.save
        user
      else
        nil
      end
    else
      nil
    end
  end
end
