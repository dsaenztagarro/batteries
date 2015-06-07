class BatteriesController < SimpleCrud::BaseController
  default_crud

  private

  def battery_params
    params.require(:battery).permit(:battery_type_id)
  end
end
