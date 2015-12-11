# Defines helpers for showing alert messages
module MessageHelper
  %w(success info warning danger).each do |level|
    define_method "alert_#{level}".to_s do |message|
      render 'shared/alert', level: level, message: message
    end
  end

  def alert_empty(relation)
    model = title_from_relation(relation)
    message = t 'panel.empty', model: model
    alert_info message
  end

  # @param object [ActiveRecord::Relation]
  # @return [String] The title of the panel base on the relation object
  def title_from_relation(object)
    model = t "model.#{object.class.to_s.downcase.split('::').first}"
    t 'panel.action.index', model: model
  end

  def show_flash
    flash.keys.inject([]) do |memo, key|
      memo << send("alert_#{level_for(key)}", flash[key])
    end.join.html_safe
  end

  def level_for(key)
    case key.to_sym
    when :notice then :success
    when :alert then :danger
    else key
    end
  end
end
