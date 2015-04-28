module SimpleCrud
  module Accessors
    def model_klass
      self.class.model_klass
    end

    def model
      instance_variable_get model_name
    end

    def model!(value)
      instance_variable_set model_name, value
    end

    def model_name
      "@#{model_klass.to_s.downcase}"
    end

    def models
      instance_variable_get models_name
    end

    def models!(value)
      instance_variable_set models_name, value
    end

    def models_name
      "@#{model_klass.to_s.downcase.pluralize}"
    end
  end
end
