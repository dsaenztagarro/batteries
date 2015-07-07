class PropertiesController < ApplicationController
  respond_to :html, :js, :json

  def create
    debugger
    @attributable = find_attributable
    @property = @attributable.properties.build(property_params)

		respond_to do |format|
			if @property.save
      	flash[:notice] = 'Successfully created property'
				format.html { redirect_to(@attributable) }
				format.js {}
			else
      	flash[:error] = 'Error adding property.'
				format.html { render :action => "new" }
				format.json  { render :json => model.errors, :status => :unprocessable_entity }
			end
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