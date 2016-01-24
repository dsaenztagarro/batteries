# Manages actions related to battery pack resource
class BatteryPacksController < SimpleCrud::BaseController
  default_crud

  private

  def battery_pack_params
    params.require(:battery_pack).permit(
      :battery_pack_model_id
    )
  end
end
