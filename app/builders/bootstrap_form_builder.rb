# This class extends default form builder to adapt to Bootstrap theme
class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
  %w(text_field password_field email_field select collection_select label
     submit).each do |field|
    alias_method "orig_#{field}".to_s, field.to_s
  end

  # Overrides default label method of FormBuilder
  def label_control(method, options = {})
    orig_label(method, options.merge(class: 'col-md-3'))
  end

  def text_field_control(method, orig_options = {})
    options = decorate_html(method, orig_options)
    div_col_md_9 do
      orig_text_field(method, options) +
        error_details(method)
    end
  end

  # Overrides default text_field method of FormBuilder
  %w(text_field email_field password_field).each do |field|
    define_method "#{field}_control" do |method, orig_options = {}|
      options = decorate_html(method, orig_options)
      div_col_md_9 do
        send("orig_#{field}", method, options) + error_details(method)
      end
    end
  end

  # Overrides default select method of FormBuilder
  def select_control(method, choices = nil, options_orig = {}, orig_html_options = {}, &block)
    options = orig_options.merge(include_blank: true)
    html_options = decorate_html(method, orig_html_options)
    div_col_md_9 do
      orig_select(method, choices, options, html_options, &block) +
        error_details(method)
    end
  end

  # Overrides default collection_select method of FormBuilder
  def collection_select_control(method, collection, value_method, text_method,
                                orig_options = {}, orig_html_options = {})
    options = orig_options.merge(include_blank: true)
    html_options = decorate_html(method, orig_html_options)
    div_col_md_9 do
      orig_collection_select(method, collection, value_method, text_method, options, html_options) +
        error_details(method)
    end
  end

  %w(text_field select collection_select).each do |field|
    define_method field do |method, *args, &block|
      div_form_group do
        label_control(method) + send("#{field}_control", method, *args, &block)
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
			  orig_submit(value, options)
      end
    end
  end

  private

  def error_details(method)
    if object.errors.key? method
      @template.render '/shared/error_field', errors: object.errors[method]
    end
  end

  def decorate_html(method, options)
    disabled = self.options[:disabled]
    error_class = object.errors.key?(method) ? 'parsley-error' : ''
    options.merge(class: "form-control #{error_class}", disabled: disabled)
  end

  def div_form_group(&block)
    @template.content_tag :div, class: 'form-group', &block
  end

  def div_col_md_9(&block)
    @template.content_tag :div, class: 'col-md-9', &block
  end
end
