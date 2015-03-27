json.title @project.title
json.body @project.body


json.tasks @tasks do |t|
  json.title t.title
  json.body t.body
end