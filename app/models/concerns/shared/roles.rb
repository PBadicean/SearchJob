module Shared::Roles

  extend ActiveSupport::Concern

  included do
    before_validation :set_role
  end

  # private

  def set_role
    role = self.class.name.downcase
    self.role = role unless send "#{role}?"
  end

end
