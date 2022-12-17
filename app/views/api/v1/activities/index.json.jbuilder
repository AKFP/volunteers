json.success      true
json.messages     ["Activities list."]
json.data do
  json.array! @activities, partial: 'activity', as: :activity
end