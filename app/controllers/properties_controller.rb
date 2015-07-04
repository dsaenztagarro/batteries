class PropertiesController < ApplicationController

  def create
    @attributable = find_attributable
    @property = @attributable.properties.build(property_params)
    if @property.save
      flash[:notice] = 'Successfully created property'
      redirect_to @attributable
    else
      flash[:error] = 'Error adding property.'
    end
  end

  private

  def property_params
    params.require(:property).permit(:property_type_id, :value)
  end

  def find_attributable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
