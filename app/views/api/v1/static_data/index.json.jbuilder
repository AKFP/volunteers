json.success      true
json.messages     ["Static data list"]
json.data do
  json.professional_details   @data["professional_details"]
  json.education_level        @data["education_level"]
  json.subject_area           @data["subject_area"]
  json.marketing_medium       @data["marketing_medium"]
  json.skills do
    json.partial! "api/v1/skills/skill", collection: @skills, as: :s
  end

  json.causes do
    json.partial! "api/v1/causes/cause", collection: @causes, as: :c
  end

  json.cities do
    json.partial! "api/v1/cities/city", collection: @cities, as: :c
  end

end