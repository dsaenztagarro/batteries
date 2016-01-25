# Provides helpers for bootstrap form builder
module BootstrapFormBuilderHelper
  def div_wrapper
    div_form_group do
      div_col_md_9 do
        yield
      end
    end
  end

  def div_form_group(&block)
    @template.content_tag :div, class: 'form-group', &block
  end

  # @param method [Symbol] The model method
  # @return [String] The list of errors related to `method` field
  def error_details(method)
    return unless object.errors.key? method
    @template.render '/shared/error_field', errors: object.errors[method]
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
