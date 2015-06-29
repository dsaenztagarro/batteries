class DevicePropertyTypesController < SimpleCrud::BaseController
  default_crud

  private

  def device_property_type_params
    params.require(:device_property_type).permit(:name)
  end
end
