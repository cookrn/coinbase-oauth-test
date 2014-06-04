OmniAuth.config.logger = Rails.logger

application = Rails.application

application.config.middleware.use OmniAuth::Builder do
  coinbase_key    = ( application.secrets.coinbase_api_key rescue false )
  coinbase_secret = ( application.secrets.coinbase_api_secret rescue false )

  if coinbase_key.present? && coinbase_secret.present?
    provider \
      :coinbase,
      coinbase_key,
      coinbase_secret
  end
end
