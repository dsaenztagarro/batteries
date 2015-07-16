# This class extends default form builder to adapt to Bootstrap theme
#
class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
  alias :label_orig :label
  alias :submit_orig :submit
  alias :text_field_orig :text_field
  alias :select_orig :select

  # Overrides default label method of FormBuilder
  def label(method, options = {})
    label_orig(method, options.merge(class: 'col-md-3'))
  end

  # Overrides default text_field method of FormBuilder
  def text_field(method, options_orig = {})
    options = decorate(method, options_orig)
    div_col_md_9 do
      text_field_orig(method, options) + error_details(method)
    end
  end

  # Overrides default select method of FormBuilder
  def select(method, choices = nil, options_orig = {}, html_options_orig = {}, &block)
    options = options_orig.merge(include_blank: true)
    html_options = decorate(method, html_options_orig)
    div_col_md_9 do
      select_orig(method, choices, options, html_options, &block)
    end
  end

  # Overrides default collection_select method of FormBuilder
  def collection_select(method, collection, value_method, text_method, options = {}, html_options_orig = {})
    html_options = decorate(method, html_options_orig)
    div_col_md_9 do
      super(method, collection, value_method, text_method, options, html_options)
    end
  end

  %w(text_field select collection_select).each do |field|
    define_method "#{field}_group" do |method, *args, &block|
      div_form_group do
        label(method) + send(field, method, *args, &block)
      end
    end
  end

  def input_group_for(text, &block)
    @template.content_tag :h4, class: 'm-t-20' do
      text
    end
  end

  # Overrides default submit method of FormBuilder
  def submit(value=nil, options={})
    div_form_group do
      div_col_md_9 do
        options.merge!(class: 'btn btn-sm btn-success')
        # Disable button when the form is submitted
        data_options = options[:data] || {}
        options[:data] = data_options.merge(disable_with: 'Please wait..')
				submit_orig(value, options)
      end
    end
  end

  def error_details(method)
    if object.errors.key? method
      @template.render '/shared/error_field', errors: object.errors[method]
    end
  end

  def decorate(method, options)
    error_class = object.errors.key?(method) ? 'parsley-error' : ''
    options.merge(class: "form-control #{error_class}")
  end

  private

  def div_form_group(&block)
    @template.content_tag :div, class: 'form-group', &block
  end

  def div_col_md_9(&block)
    @template.content_tag :div, class: 'col-md-9', &block
  end
end
