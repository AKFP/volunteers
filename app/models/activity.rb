class Activity < ApplicationRecord

  ## File Attachments
  has_one_attached :header_image
  has_many_attached :pictures

  def get_skills
    Skill.where(id: self.skills)
  end

  def get_causes
    Cause.where(id: self.causes)
  end
end


# Activity.where('skills && ARRAY[?]::integer[]', [23,2]).size
# Activity.where('skills @> ARRAY[?]::integer[]', [23,2]).size