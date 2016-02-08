require 'oauth2'

# https://github.com/doorkeeper-gem/doorkeeper/wiki/authorization-flow
namespace :oauth2 do
  task :client do
    app_id = ENV['APP_ID']
    secret = ENV['SECRET']
    @client = OAuth2::Client.new(app_id, secret, site: 'http://localhost:3000')
  end

  desc 'Returns the url for requesting authorization'
  task request_authorization: :client do
    callback = 'http://localhost:3001/auth/web/callback'
    print @client.auth_code.authorize_url(redirect_uri: callback)
  end

  desc 'Returns the url for requesting access token'
  task request_access_token: :client do
    callback = 'http://localhost:3001/auth/web/callback'
    code = ENV['CODE']
    access = @client.auth_code.get_token(
      code,
      redirect_uri: callback,
      headers: { 'Authorization' => 'Basic some_password' })
    # access is a OAuth2::AccessToken
    print access.token # => access_token
  end
end
