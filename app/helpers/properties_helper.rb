module PropertiesHelper
  def nested_properties(attachable, builder)
    render "properties/#{params[:action]}", properties: attachable.properties, f: builder
  end
end
