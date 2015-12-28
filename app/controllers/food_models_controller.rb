class FoodModelsController < SimpleCrud::BaseController
  default_crud

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def food_model_params
    params.require(:food_model).permit(:brand_id, :name)
  end
end
