json.success      true
json.messages     ["Volunteer has been regitered successfully."]
json.data do
  json.partial! "activity", activity: @registration.activity
end