# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
