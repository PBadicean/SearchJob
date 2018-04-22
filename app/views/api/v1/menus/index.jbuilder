json.categories do
  json.array! @categories do |category|
    json.name category.name
    json.countWork category.count_work
    json.id category.id
  end
end
json.schedules @schedules
