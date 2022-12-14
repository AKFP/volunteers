class Skill < ApplicationRecord
  ## Associations
  has_many :skill_volunteers
  has_many :volunteers, through: :skill_volunteers
end
