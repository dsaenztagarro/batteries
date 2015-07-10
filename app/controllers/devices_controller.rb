# Controller CRUD operations over devices
class DevicesController < SimpleCrud::BaseController
  default_crud

  private

  def device_params
    params.require(:device)
      .permit(:name, properties_attributes: [:_destroy, :id, :value])
  end
end
