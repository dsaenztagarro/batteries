class FoodModelsController < SimpleCrud::BaseController
  default_crud

  private

  def food_model_params
    params.require(:food_model).permit(:brand_id, :name)
  end
end
