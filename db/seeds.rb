Admin.create do |admin|
  admin.email = 'admin@mail.ru'
  admin.name = 'Admin'
  admin.password = '123456'
end

Candidate.create do |candidate|
  candidate.email = 'candidate@mail.ru'
  candidate.name = 'Candidate'
  candidate.password = '123456'
end

Employer.create do |employer|
  employer.email = 'employer@mail.ru'
  employer.name = 'Employer'
  employer.password = '123456'
end
