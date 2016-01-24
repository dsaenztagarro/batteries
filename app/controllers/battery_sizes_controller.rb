# Manages actions related to battery size resource
class BatterySizesController < SimpleCrud::BaseController
  default_crud

  private

  def battery_size_params
    params.require(:battery_size).permit(
      :name
    )
  end
end
