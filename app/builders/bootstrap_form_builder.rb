require_relative './helpers/bootstrap_form_builder_helper'

# This class extends default form builder to adapt to Bootstrap theme
class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
  include BootstrapFormBuilderHelper
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

  # Decorates default collection_select method of FormBuilder
  def collection_select_control(method, collection, value_method, text_method,
                                orig_options = {}, orig_html_options = {})
    options = orig_options.merge(include_blank: true)
    html_options = decorate_opts(method, orig_html_options)
    div_col_md_9 do
      orig_collection_select(method, collection, value_method, text_method,
                             options, html_options) +
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
  def check_box(method, orig_options = {}, checked_value = '1',
                unchecked_value = '0')
    options = decorate_opts_with_disabled(orig_options)
    div_wrapper do
      @template.content_tag :div, class: 'checkbox' do
        label_control(method) do
          orig_check_box(method, options, checked_value, unchecked_value) +
            method.to_s.humanize
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
end
