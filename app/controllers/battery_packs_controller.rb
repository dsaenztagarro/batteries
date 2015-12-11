class BatteryPacksController < SimpleCrud::BaseController
  default_crud

  private

  def battery_pack_params
    params.require(:battery_pack).permit(
      :battery_pack_type_id
    )
  end
end
