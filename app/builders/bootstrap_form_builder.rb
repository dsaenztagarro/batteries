class BootstrapFormBuilder < ActionView::Helpers::FormBuilder

  def label(method, options = {})
    @template.label(@object_name, method,
                    options.merge(class: 'col-md-3 control-label'))
  end

  def text_field(method, options = {})
    @template.content_tag :div, class: 'col-md-9' do
      @template.text_field(
        @object_name, method, objectify_options(options).merge(class: 'form-control')
      )
    end
  end

  def text_field_group(method)
    form_group_for :text_field, method
  end

  def form_group_for(field_helper, method)
    @template.content_tag :div, class: 'form-group' do
      label(method) + send(field_helper, method)
    end
  end
end
