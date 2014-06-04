# Coinbase OAuth Test

A basic example of using Coinbase OAuth as well as the
returned tokens. Created in response to:

* A [tweet](https://twitter.com/ZackShapiro/status/474023439053766656)
* A [StackOverflow question](http://stackoverflow.com/questions/23983741/storing-an-access-token-and-refresh-token-on-the-user-model-and-using-them-again)
* Another [relevant SO question](http://stackoverflow.com/questions/21513250/coinbase-oauth2-sometimes-failed-to-renew-access-token-using-refresh-token)

## Setup

* Create a new Coinbase application [here](https://coinbase.com/oauth/applications)
* Create a `.env` file in your project root using the keys from your newly registered application

```shell
COINBASE_API_KEY="your api key goes here"
COINBASE_API_SECRET="your api secret goes here"
```

* Run `bin/rake db:setup` to initialize the database
* Run `bin/rails s` for the server
* Visit the root '/' route
* Click the link to authenticate via OAuth for Coinbase
* You should be redirected to a 'test_refresh' page showing newly created tokens on each page load using the `Coinbase::OAuthClient#refresh!` method

## Other Notes

* A very similar, [official repo](https://github.com/coinbase/coinbase-oauth-rails-example)

## License

Please [email me](mailto:cookrn@gmail.com) with any questions.

