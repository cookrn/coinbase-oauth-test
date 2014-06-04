class PagesController < ApplicationController
  before_filter \
    :redirect_if_current_user,
    :only => :authentication_options

  before_filter \
    :require_current_user,
    :only => :test_refresh

  def authentication_options
    @options = %w( coinbase )
  end

  def test_refresh
    @old_tokens =
      {
        :access_token  => current_user.access_token,
        :refresh_token => current_user.refresh_token
      }

    client =
      Coinbase::OAuthClient.new \
        Rails.application.secrets.coinbase_api_key,
        Rails.application.secrets.coinbase_api_secret,
        @old_tokens.to_h

    new_token = client.refresh!

    @new_tokens =
      {
        :access_token  => new_token.token,
        :refresh_token => new_token.refresh_token
      }

    current_user.access_token  = @new_tokens[ :access_token ]
    current_user.refresh_token = @new_tokens[ :refresh_token ]
    current_user.save!
  end

  private def redirect_if_current_user
    if current_user?
      redirect_to test_refresh_path
    end
  end

  private def require_current_user
    if !current_user?
      redirect_to root_path
    end
  end
end
