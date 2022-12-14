json.success      true
json.messages     ["Static data list"]
json.data do
  json.professional_details   @data["professional_details"]
  json.education_level        @data["education_level"]
  json.subject_area           @data["subject_area"]
  json.marketing_medium       @data["marketing_medium"]
  json.skills                 Skill.all.order(:name).map{|s| {id: s.id, name: s.name}}
  json.causes                 Cause.all.order(:name).map{|c| {id: c.id, name: c.name}}
end