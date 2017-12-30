class Employer < User

  include Shared::Roles

  default_scope { employer }

end
