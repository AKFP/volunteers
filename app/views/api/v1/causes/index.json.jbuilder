json.success      true
json.messages     ["Causes list."]
json.data do
  json.partial! "api/v1/causes/cause", collection: @causes, as: :c
end