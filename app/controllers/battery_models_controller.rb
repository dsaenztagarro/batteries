class BatteryModelsController < SimpleCrud::BaseController
  default_crud

  private

  def battery_model_params
    params.require(:battery_model).permit(
      :battery_size_id,
      :capacity,
      :name,
      :rechargeable
    )
  end
end
