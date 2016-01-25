# This class extends default form builder to adapt authentication pages to
# Bootstrap theme
class AuthFormBuilder < ActionView::Helpers::FormBuilder
  %w(email_field password_field check_box submit).each do |field|
    alias_method "orig_#{field}".to_s, field.to_s
  end

  %w(email_field password_field).each do |field|
    define_method field.to_s do |method, orig_options = {}|
      options = decorate_html(method, orig_options)
      div_control do
        send("orig_#{field}", method, options) + error_details(method)
      end
    end
  end

  def check_box(method, _options = {})
    @template.content_tag :div, class: 'checkbox m-b-20' do
      html = '<label>' + orig_check_box(method) + I18n.t(method) + '</label>'
      html.html_safe
    end
  end

  def submit(value = nil, options = {})
    @template.content_tag :div, class: 'login-buttons' do
      options.merge!(class: 'btn btn-success btn-block btn-lg')
      # Disable button when the form is submitted
      data_options = options[:data] || {}
      options[:data] = data_options.merge(disable_with: 'Please wait..')
      orig_submit(value, options)
    end
  end

  private

  def error_details(method)
    return unless object.errors.key? method
    @template.render '/shared/error_field', errors: object.errors[method]
  end

  def decorate_html(method, options)
    error_class = object.errors.key?(method) ? 'parsley-error' : ''
    options.merge(class: "form-control input-lg #{error_class}")
      .merge(placeholder: I18n.t(method))
  end

  def div_control(&block)
    @template.content_tag :div, class: 'form-group m-b-20', &block
  end
end
