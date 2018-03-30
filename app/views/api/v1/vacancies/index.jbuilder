json.array! @vacancies do |vacancy|
  json.name vacancy.name
  json.company vacancy.info.company_name
end
