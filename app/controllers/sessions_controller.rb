class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_auth_hash auth_hash

    redirect_path = root_path

    if user.present?
      self.current_user = user
      redirect_path = test_refresh_path
    end

    redirect_to redirect_path
  end

  protected def auth_hash
    request.env['omniauth.auth']
  end
end
