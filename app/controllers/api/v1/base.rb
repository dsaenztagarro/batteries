module API
  module V1
    class Base < Grape::API
      mount API::V1::Devices
      # mount API::V1::AnotherResource
    end
  end
end
