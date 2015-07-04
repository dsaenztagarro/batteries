module MessageHelper
  %w(success info warning error).each do |level|
    define_method "alert_#{level}".to_s do |message|
      render 'shared/alert', level: level, message: message
    end
  end
end
