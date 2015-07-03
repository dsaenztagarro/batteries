module FormHelper

  def panel_for(title, &block)
    render layout: '/shared/panel', locals: { title: title }, &block
  end

  # Creates form with default bootstrap class
  def form_horizontal_for(record, options = {}, &block)
    options[:html] = {} unless options.key? :html
    options[:html].merge!(class: 'form-horizontal')
    form_for(record, options, &block)
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + '_fields', f: builder)
    end
    link_to(name, '#', class: 'btn btn-primary btn-sm m-r-5 add_fields', data: {id: id, fields: fields.gsub("\n", '')})
  end
end
