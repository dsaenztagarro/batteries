# This class extends default form builder to adapt to Bootstrap theme
#
class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
  alias :submit_orig :submit

  # Overrides default label method of FormBuilder
  def label(method, options = {})
    @template.label(@object_name, method,
                    options.merge(class: 'col-md-3')) # control-label
  end

  # Overrides default text_field method of FormBuilder
  def text_field(method, options = {})
    div_col_md_9 do
      @template.text_field(
        @object_name, method, objectify_options(options).merge(class: 'form-control')
      )
    end
  end

  def collection_select(method, collection, value_method, text_method, options = {}, html_options = {})
    html_options.merge!(class: 'form-control')
    div_col_md_9 do
      @template.collection_select(@object_name, method, collection, value_method, text_method, objectify_options(options), @default_options.merge(html_options))
    end
  end

  %w(collection_select text_field).each do |field|
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
				submit_orig(value, options.merge(class: 'btn btn-sm btn-success'))
        # button(value, class: 'btn btn-sm btn-success')
      end
    end
  end

  private

  def div_form_group(&block)
    @template.content_tag :div, class: 'form-group', &block
  end

  def div_col_md_9(&block)
    @template.content_tag :div, class: 'col-md-9', &block
  end
end
