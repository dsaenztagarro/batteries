# This class extends default form builder to adapt to Bootstrap theme
class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
  # Create alias to access default methods of FormBuilder
  %w(
    check_box
    collection_select
    email_field
    label
    password_field
    select
    submit
    text_area
    text_field
  ).each do |field|
    alias_method "orig_#{field}", field
  end

  # Add control form methods to FormBuilder
  %w(
    email_field
    password_field
    text_area
    text_field
  ).each do |field|
    define_method "#{field}_control" do |method, orig_options = {}|
      options = decorate_opts(method, orig_options)
      div_col_md_9 do
        send("orig_#{field}", method, options) + error_details(method)
      end
    end
  end

  # Decorates default label method of FormBuilder
  def label_control(method, text = nil, options = {}, &block)
    orig_label(method, text, options.merge(class: 'col-md-3'), &block)
  end

  # Overrides default select method of FormBuilder
  # def select_control(method, choices = nil, _options_orig = {}, orig_html_options = {}, &block)
  #   options = orig_options.merge(include_blank: true)
  #   html_options = decorate_html(method, orig_html_options)
  #   div_col_md_9 do
  #     orig_select(method, choices, options, html_options, &block) +
  #       error_details(method)
  #   end
  # end

  # Decorates default collection_select method of FormBuilder
  def collection_select_control(method, collection, value_method, text_method,
                                orig_options = {}, orig_html_options = {})
    options = orig_options.merge(include_blank: true)
    html_options = decorate_opts(method, orig_html_options)
    div_col_md_9 do
      orig_collection_select(method, collection, value_method, text_method, options, html_options) +
        error_details(method)
    end
  end

  # Override default methods of FormBuilder
  %w(
    collection_select
    select
    text_area
    text_field
  ).each do |field|
    define_method field do |method, *args, &block|
      div_form_group do
        label_control(method) + send("#{field}_control", method, *args, &block)
      end
    end
  end

  # Override check_box method of FormBuilder
  def check_box(method, orig_options = {}, checked_value = '1', unchecked_value = '0')
    options = decorate_opts_with_disabled(orig_options)
    div_form_group do
      div_col_md_9 do
        @template.content_tag :div, class: 'checkbox' do
          label_control(method) do
            orig_check_box(method, options, checked_value, unchecked_value) +
              method.to_s.humanize
          end
        end
      end
    end
  end

  # Overrides default submit method of FormBuilder
  def submit(value = nil, options = {})
    div_form_group do
      div_col_md_9 do
        options.merge!(class: 'btn btn-success')
        # Disable button when the form is submitted
        data_options = options[:data] || {}
        options[:data] = data_options.merge(disable_with: 'Please wait..')
        orig_submit(value, options)
      end
    end
  end

  def div_form_group(&block)
    @template.content_tag :div, class: 'form-group', &block
  end

  private

  def error_details(method)
    if object.errors.key? method
      @template.render '/shared/error_field', errors: object.errors[method]
    end
  end

  # @param method [Symbol] The model method
  # @param [Hash] options the options to create the form field
  # @return [Hash] The options decorated
  def decorate_opts(method, options)
    opts = decorate_opts_with_errors(method, options)
    decorate_opts_with_disabled(opts)
  end

  # @param method [Symbol] The model method
  # @param [Hash] options the options to create the form field
  # @return [Hash] The options decorated for showing errors
  def decorate_opts_with_errors(method, options)
    error_class = object.errors.key?(method) ? 'parsley-error' : ''
    options.merge(class: "form-control #{error_class}")
  end

  # @param [Hash] options the options to create the form field
  # @return [Hash] The options decorated for showing disabled field
  def decorate_opts_with_disabled(options)
    options.merge(disabled: self.options[:disabled])
  end

  def div_col_md_9(&block)
    @template.content_tag :div, class: 'col-md-9', &block
  end
end
