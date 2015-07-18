# Controller CRUD operations over devices
class DevicesController < SimpleCrud::BaseController
  default_crud

  private

  def device_params
    params.require(:device)
      .permit(:avatar, :device_category_id, :device_filter_list, :name,
              properties_attributes: [:_destroy, :id, :value])
  end
end
