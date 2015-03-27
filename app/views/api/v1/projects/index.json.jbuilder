json.array! @projects do |project|
  json.id project.id
  json.title project.title
  json.body project.body
end
