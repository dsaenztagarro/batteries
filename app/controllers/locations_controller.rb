# Manages actions related to location resource
class LocationsController < SimpleCrud::BaseController
  default_crud

  private

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def location_params
    params.require(:location).permit(:name)
  end
end
