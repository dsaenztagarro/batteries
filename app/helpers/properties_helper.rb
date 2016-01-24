# Provides helpers for properties of models
module PropertiesHelper
  def properties_for(attachable, builder)
    content = render "properties/#{params[:action]}",
                     properties: attachable.properties,
                     f: builder
    header_section('properties') + content
  end

  def avatar_for(model, builder)
    render '/shared/avatar', model: model, f: builder
  end

  def tags_for(model, builder)
    render '/shared/tags', model: model, f: builder
  end

  %w(show edit).each do |action|
    define_method "#{action}?" do
      params[:action] == 'show'
    end
  end
end
