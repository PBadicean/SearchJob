json.array! @vacancies do |vacancy|
  json.name vacancy.name
  json.company vacancy.info.company_name
  json.created_at vacancy.created_at
  json.country vacancy.country
  json.salary_min vacancy.salary_min
  json.experience vacancy.experience
  json.schedule vacancy.schedule
  json.category_id vacancy.category.id
end
