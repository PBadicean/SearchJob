json.array! @vacancies do |vacancy|
  json.name vacancy.name
  json.company vacancy.info.company_name
  json.created_at vacancy.created_at
  json.country vacancy.country
end
