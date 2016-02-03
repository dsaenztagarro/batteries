module API
  module V1
    class Base < Grape::API
      mount API::V1::Devices
      add_swagger_documentation api_version: 'v1',
                                mount_path: '/swagger_doc/v1',
                                hide_documentation_path: true
    end
  end
end
