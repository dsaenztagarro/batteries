# Manages actions related to foods resource
class FoodsController < SimpleCrud::BaseController
  default_crud

  private

  def food_params
    params.require(:food).permit(:food_model_id)
  end
end
