require File.expand_path('../boot', __FILE__)

require 'rails'

%w(
  active_record
  action_controller
  action_view
).each do | framework |
  begin
    require "#{ framework }/railtie"
  rescue LoadError
  end
end

Bundler.require(*Rails.groups)

module CoinbaseOauthTest
  class Application < Rails::Application
  end
end
