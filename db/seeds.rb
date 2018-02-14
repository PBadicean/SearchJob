Admin.create do |admin|
  admin.email = 'admin@mail.ru'
  admin.name = 'Admin'
  admin.password = '123456'
end

Candidate.create do |candidate|
  candidate.email = 'candidate@mail.ru'
  candidate.name = 'Candidate'
  candidate.password = '123456'
  candidate.birthday = Time.now
  File.open("#{Rails.root}/public/avatars/1.png") do |f|
    candidate.avatar = f
  end
end

Employer.create do |employer|
  employer.email = 'employer@mail.ru'
  employer.name = 'Employer'
  employer.password = '123456'
end

Category.create do |category|
  category.name = 'IT'
end

Category.create do |subcategory|
  subcategory.name = 'Programming'
  subcategory.parent_id = Category.first.try(:id)
end

7.times do |i|
  Resume.create do |resume|
    resume.position = "RoR Programmer #{i}"
    resume.salary = 35000
    resume.candidate = Candidate.first
    resume.category = Category.where(name: 'Programming').first
    resume.tags = "Ruby, Rails, Js, JQuery, Python, HTML, CSS, SCSS"
    resume.about_me = "My full name is Bushueva Valeria Dmitrievna. I was born in Moscow, Russia in 2002."
  end
end

Experience.create do |experience|
  experience.date_start = '04.06.2015'
  experience.date_end = '01.07.2016'
  experience.position = 'Junior'
  experience.company = 'Audi'
  experience.resume = Resume.first
  experience.duty = 'The official online destination for Call of Duty t-shirts, hoodies, jackets, hats, collectibles, posters, toys, and other exclusive apparel and accessories.'
end

Experience.create do |experience|
  experience.date_start = '04.06.2012'
  experience.date_end = '01.07.2014'
  experience.position = 'TeamLead'
  experience.company = 'Mail.ru'
  experience.resume = Resume.first
  experience.duty = 'The hoodies, jackets, hats, collectibles, posters, toys, and other official online destination for Call of Duty t-shirts,exclusive apparel and accessories.'
end

Vacancy.create do |vacancy|
  vacancy.name = "Ruby Programmer"
  vacancy.salary_min = 25000
  vacancy.salary_max = 50000
  vacancy.schedule = 1
  vacancy.experience = 1
  vacancy.employer = Employer.first
  vacancy.category = Category.first
  vacancy.discription = 'The hoodies, jackets, hats, collectibles, posters, toys, and other official online destination for Call of Duty t-shirts,exclusive apparel and accessories'
  vacancy.place_id = 'ChIJ53USP0nBhkcRjQ50xhPN_zw'
  vacancy.key_skills = 'Ruby, Programming, Java'
  vacancy.save!
end
