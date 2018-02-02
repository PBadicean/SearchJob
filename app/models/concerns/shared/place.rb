module Shared::Place

  extend ActiveSupport::Concern

  def error_class_name
    errors.messages[:'info.place_id'].any? ? 'is-invalid' : ''
  end

end
