json.id               activity.id
json.title            activity.title
json.description      activity.description
json.about_organizer  activity.about_organizer
json.start_time       formatted_date(activity.start_time, "datetime")
json.end_time         formatted_date(activity.end_time, "datetime")
json.points           activity.points
json.skills do
  json.array! activity.get_skills, partial: 'api/v1/skills/skill', as: :s
end
json.causes do
  json.array! activity.get_causes, partial: 'api/v1/causes/cause', as: :c
end

json.venues do
  json.array! activity.venues, partial: 'api/v1/activities/venue', as: :v
end