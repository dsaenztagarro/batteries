class BatteriesController < SimpleCrud::BaseController
  default_crud

  private

  def battery_params
    params[:battery]
  end
end
