class Volunteer < ApplicationRecord
  PROFESSIONAL_DETAILS  = YAML.load_file( 'lib/data/data.yml' )["professional_details"]
  SKILLS                = YAML.load_file( 'lib/data/data.yml' )["skills"]
  AREA_OF_INTEREST      = YAML.load_file( 'lib/data/data.yml' )["area_of_interest"]
  MARKETING_MEDIUM      = YAML.load_file( 'lib/data/data.yml' )["marketing_medium"]

  validates :name, presence: true
  validates :email, presence: { message: 'Please enter a valid email address.' }

end
