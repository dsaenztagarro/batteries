class BatteryPackTypesController < SimpleCrud::BaseController
  default_crud

  %w(after_destroy
     after_save
     after_update_attributes).each do |hook|
    define_method hook do |result|
      expire_fragment('all_battery_pack_types') if result
    end
  end

  private

  def battery_pack_type_params
    params.require(:battery_pack_type).permit(
      :description,
      :name,
      :precharged,
      :size
    )
  end
end
