require 'grape-swagger'

module API
  class Base < Grape::API
    default_format :json
    format :json
    # use ::WineBouncer::OAuth2
    mount API::V1::Base
  end
end
