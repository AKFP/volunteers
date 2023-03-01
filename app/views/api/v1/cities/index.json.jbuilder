json.success      true
json.messages     ["Cities list."]
json.data do
  json.array! @cities do |c|
    json.partial! "city", c: c
  end
end