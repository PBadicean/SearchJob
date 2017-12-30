class Admin < User

  include Shared::Roles

  default_scope { admin }

end
