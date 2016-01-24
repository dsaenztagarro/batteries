# Manages actions related to battery resource
class BatteriesController < SimpleCrud::BaseController
  default_crud

  private

  def battery_params
    params.require(:battery).permit(
      :battery_model_id
    )
  end
end
