class Candidate < User

  include Shared::Roles

  default_scope { candidate }

end
