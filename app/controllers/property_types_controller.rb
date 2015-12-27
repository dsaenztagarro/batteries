class PropertyTypesController < SimpleCrud::BaseController
  default_crud

  private

  def property_type_params
    params.require(:property_type).permit(:name)
  end
end
