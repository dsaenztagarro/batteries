class DeviceAttributeTypesController < SimpleCrud::BaseController
  default_crud

  private

  def device_attribute_type_params
    params.require(:device_attribute_type).permit(:name)
  end
end
