# Manages actions related to device category resource
class DeviceCategoriesController < SimpleCrud::BaseController
  default_crud

  private

  def device_category_params
    params.require(:device_category).permit(:name)
  end
end
