class DeviceCategoriesController < SimpleCrud::BaseController
  default_crud

  def after_save(result)
    expire_fragment('all_device_categories') if result
  end

  def after_update_attributes(result)
    expire_fragment('all_device_categories') if result
  end

  private

  def device_category_params
    params.require(:device_category).permit(:name)
  end
end
