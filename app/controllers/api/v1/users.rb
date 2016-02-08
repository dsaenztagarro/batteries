module API
  module V1
    class Users < Grape::API
      include API::V1::Defaults

      resource :users do
        desc "Current user's information in access token's scope<span class='accstr'>*</span>", {
          notes: <<-NOTE
            Current user is the owner of the `access_token` you use in the request.
          NOTE
        }
        # oauth2 # This endpoint requires authentication
        get '/me', root: :devices do
          result = {
            id: current_user.id.to_s,
            user: {
              email: current_user.email,
              name: current_user.name
            }
          }
        end
      end
    end
  end
end
