json.categories do
  json.array! @categories do |category|
    json.name category.name
    json.countWork 125
    json.id category.id
  end
end
json.schedules @schedules
