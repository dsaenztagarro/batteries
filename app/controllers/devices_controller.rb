# Controller CRUD operations over devices
class DevicesController < SimpleCrud::BaseController
  default_crud

  private

  def device_params
    debugger
    params.require(:device)
      .permit(:avatar, :geek_list, :name,
              properties_attributes: [:_destroy, :id, :value])
  end
end
