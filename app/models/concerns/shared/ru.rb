# frozen_string_literal: false

module Shared::Ru
  extend ActiveSupport::Concern

  def ru_datetime(field, format = 'ru_date')
    value = send(field.to_sym)
    value.try(:to_s, format.to_sym) || ''
  end

end
