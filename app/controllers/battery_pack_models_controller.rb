class BatteryPackModelsController < SimpleCrud::BaseController
  default_crud

  %w(after_destroy
     after_save
     after_update_attributes).each do |hook|
    define_method hook do |result|
      expire_fragment('all_battery_pack_models') if result
    end
  end

  private

  def battery_pack_model_params
    params.require(:battery_pack_model).permit(
			:battery_model_id,
      :precharged,
      :size
    )
  end
end
