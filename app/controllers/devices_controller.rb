class DevicesController < SimpleCrud::BaseController
  default_crud

  private

  def device_params
    params.require(:device).permit(:name)
  end
end
