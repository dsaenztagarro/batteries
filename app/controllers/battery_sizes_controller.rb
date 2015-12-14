class BatterySizesController < SimpleCrud::BaseController
  default_crud

  private

  def battery_size_params
    params.require(:battery_size).permit(
      :battery_size_model_id
    )
  end
end
