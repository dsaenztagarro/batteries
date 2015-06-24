module FormHelper

  # Creates form with default bootstrap class
  def form_horizontal_for(record, options = {}, &block)
    options[:html] = {} unless options.key? :html
    options[:html].merge!(class: 'form-horizontal')
    form_for(record, options, &block)
  end
end
