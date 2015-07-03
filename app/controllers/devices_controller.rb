class DevicesController < SimpleCrud::BaseController
  default_crud

  def edit
    3.times {
    @device.properties.build
    }
  end

  private

  def device_params
    params.require(:device).permit(:name)
  end
end
