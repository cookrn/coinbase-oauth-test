Rails.application.routes.draw do
  root :to => 'pages#authentication_options'

  get \
    '/auth/:provider/callback',
    :to => 'sessions#create'

  get \
    '/test_refresh',
    :to => 'pages#test_refresh',
    :as => :test_refresh
end
