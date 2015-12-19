class BrandsController < SimpleCrud::BaseController
  default_crud

  private

  def brand_params
    params.require(:brand).permit(
      :name
    )
  end
end
