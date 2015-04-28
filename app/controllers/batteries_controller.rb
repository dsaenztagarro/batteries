class BatteriesController < SimpleCrud::BaseController
  crud_for Battery

  private

  def battery_params
    params.require(:battery).permit(:battery_type_id)
  end
end
