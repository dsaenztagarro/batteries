class AuthFormBuilder < ActionView::Helpers::FormBuilder
  %w(text_field password_field email_field submit).each do |field|
    alias_method "orig_#{field}".to_s, field.to_s
  end

  def text_field_control(method, orig_options = {})
    options = decorate_html(method, orig_options)
    div_col_md_9 do
      orig_text_field(method, options) +
        error_details(method)
    end
  end

  private

  def decorate_html(method, options)
    error_class = object.errors.key?(method) ? 'parsley-error' : ''
    options.merge(class: "form-control input-lg #{error_class}", disabled: disabled)
  end
end
