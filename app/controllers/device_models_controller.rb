# Manages actions related to device model resource
class DeviceModelsController < SimpleCrud::BaseController
  default_crud

  private

  def device_model_params
    params.require(:device_model).permit(
      :name,
      :battery_size_id,
      :battery_number
    )
  end
end
