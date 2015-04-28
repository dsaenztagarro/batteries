class BatteryTypesController < SimpleCrud::BaseController
  crud_for BatteryType

  private

  def battery_type_params
    params.require(:battery_type).permit(:name)
  end
end
