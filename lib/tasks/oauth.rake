require 'oauth2'

namespace :oauth do
  task :client do
    callback = 'http://localhost:3001/auth/myfamilyweb/callback'
    app_id = 'f736baee9b254f6b85dcdc4a93c10c5ffec2e8d255fc21226aa63f8dd683e825'
    secret = '395e74c7f4e74a8f67e4a456dcaec41a959c0fd88f2d4d454121c9f169cf39c4'
    client = OAuth2::Client.new(app_id, secret, site: 'http://localhost:3000')
    print client.auth_code.authorize_url(redirect_uri: callback)
  end
end

# http://localhost:3001/oauth/authorize?client_id=f736baee9b254f6b85dcdc4a93c10c5ffec2e8d255fc21226aa63f8dd683e825&redirect_uri=http%3A%2F%2Flocalhost%3A3001%2Fauth%2Fmyfamilyweb%2Fcallback&response_type=code
