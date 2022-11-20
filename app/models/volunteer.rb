class Volunteer < ApplicationRecord
  PROFESSIONAL_DETAILS  = YAML.load_file( 'lib/data/data.yml' )["professional_details"]
  SKILLS                = YAML.load_file( 'lib/data/data.yml' )["skills"]
  AREA_OF_INTEREST      = YAML.load_file( 'lib/data/data.yml' )["area_of_interest"]
  MARKETING_MEDIUM      = YAML.load_file( 'lib/data/data.yml' )["marketing_medium"]

  enum status: [:registered, :approved, :rejected]

  ## Validations
  validates :name, presence: { message: "Name can't be blank."}
  validates :email, presence: { message: 'Please enter a valid email address.' }
  validates :user_id, uniqueness: { message: 'A user can have only one volunteer profile.', allow_blank: true }

  ## Associations
  belongs_to :user, optional: true
end
