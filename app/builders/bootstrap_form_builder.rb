# This class extends default form builder to adapt to Bootstrap theme
class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
  alias :submit_orig :submit

  # Overrides default label method of FormBuilder
  def label(method, options = {})
    @template.label(@object_name, method,
                    options.merge(class: 'col-md-3 control-label'))
  end

  # Overrides default text_field method of FormBuilder
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
    div_form_group do
      label(method) + send(field_helper, method)
    end
  end

  # Overrides default submit method of FormBuilder
  def submit(value=nil)
    div_form_group do
      @template.content_tag :div, class: 'col-md-9' do
        button(value, class: 'btn btn-sm btn-success')
      end
    end
  end

  # Helpers

  def div_form_group(&block)
    @template.content_tag :div, class: 'form-group', &block
  end
end
