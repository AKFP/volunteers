if @activity
  json.success      true
  json.messages     ["Activity created successfully."]
  json.data do
    json.partial! "activity", activity: @activity
  end
end
