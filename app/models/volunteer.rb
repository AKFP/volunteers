class Volunteer < ApplicationRecord
  PROFESSIONAL_DETAILS  = YAML.load_file( 'lib/data/data.yml' )["professional_details"]
  AREA_OF_INTEREST      = YAML.load_file( 'lib/data/data.yml' )["area_of_interest"]
  MARKETING_MEDIUM      = YAML.load_file( 'lib/data/data.yml' )["marketing_medium"]
  EDUCATION_LEVEL       = YAML.load_file( 'lib/data/data.yml' )["education_level"]
  SUBJECT_AREA          = YAML.load_file( 'lib/data/data.yml' )["subject_area"]
  CAUSES                = YAML.load_file( 'lib/data/data.yml' )["causes"]

  enum status: [:registered, :approved, :rejected]

  ## Validations
  validates :name, presence: { message: "Name can't be blank."}
  validates :email, presence: { message: 'Please enter a valid email address.' }
  validates :user_id, uniqueness: { message: 'A user can have only one volunteer profile.', allow_blank: true }

  ## Associations
  belongs_to :user, optional: true
  belongs_to :city
  has_one_attached :profile_pic
end
