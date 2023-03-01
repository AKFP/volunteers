json.success      true
json.messages     ["Skills list."]
json.data do
  json.array! @skills do |s|
    json.partial! "skill", s: s
  end
end