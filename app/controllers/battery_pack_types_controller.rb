class BatteryPackTypesController < SimpleCrud::BaseController
  default_crud

  private

  def battery_pack_type_params
    params.require(:battery_pack_type).permit(
      :description,
      :name,
      :size
    )
  end
end
