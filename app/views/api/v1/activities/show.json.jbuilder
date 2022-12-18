json.success      true
json.messages     ["Activity detail."]
json.data do
  json.partial! "activity", activity: @activity
end