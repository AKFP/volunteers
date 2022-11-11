if @volunteer
  json.success      true
  json.messages     ["Volunteer registered successfully."]
  json.data do
    json.partial! "volunteer", v: @volunteer
  end
end
