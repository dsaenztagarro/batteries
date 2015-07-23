module MessageHelper
  %w(success info warning danger).each do |level|
    define_method "alert_#{level}".to_s do |message|
      render 'shared/alert', level: level, message: message
    end
  end

  def show_flash
    flash.keys.inject([]) do |memo, key|
      memo << send("alert_#{level_for(key)}", flash[key])
    end.join.html_safe
  end

  def level_for(key)
    case key.to_sym
    when :notice then :success;
    when :alert then :danger;
    else key
    end
  end
end
