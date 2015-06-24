module FormHelper

  def panel_for(title, &block)
    render layout: '/shared/panel', locals: { title: title }, &block
  end

  # Creates form with default bootstrap class
  def form_horizontal_for(record, options = {}, &block)
    options[:html] = {} unless options.key? :html
    options[:html].merge!(class: 'form-horizontal')
    form_for(record, options, &block)
  end
end
