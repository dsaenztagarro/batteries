module API
  module V1
    class Base < Grape::API
      mount API::V1::Devices
      mount API::V1::Users
      add_swagger_documentation api_version: 'v1',
                                hide_documentation_path: true,
                                hide_format: true, # don't show .json
                                markdown: GrapeSwagger::Markdown::KramdownAdapter,
                                mount_path: '/api/v1/swagger_doc'
    end
  end
end
