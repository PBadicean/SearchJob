class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def human_enum_name(field)
    I18n.t("activerecord.attributes.#{model_name.i18n_key}.#{field.to_s.pluralize}.#{self.send(field)}")
  end

  def self.human_enum_name(enum_name, enum_value)
    I18n.t("activerecord.attributes.#{model_name.i18n_key}.#{enum_name.to_s.pluralize}.#{enum_value}")
  end
end
