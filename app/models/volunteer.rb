class Volunteer < ApplicationRecord
  PROFESSIONAL_DETAILS  = YAML.load_file( 'lib/data/data.yml' )["professional_details"]
  AREA_OF_INTEREST      = YAML.load_file( 'lib/data/data.yml' )["area_of_interest"]
  MARKETING_MEDIUM      = YAML.load_file( 'lib/data/data.yml' )["marketing_medium"]
  EDUCATION_LEVEL       = YAML.load_file( 'lib/data/data.yml' )["education_level"]
  SUBJECT_AREA          = YAML.load_file( 'lib/data/data.yml' )["subject_area"]

  enum status: [:registered, :approved, :rejected]
  # enum education_status: [:unemployed, :employed]

  ## Validations
  validates :name, presence: { message: "Name can't be blank."}
  validates :email, presence: { message: 'Please enter a valid email address.' }
  validates :user_id, uniqueness: { message: 'A user can have only one volunteer profile.', allow_blank: true }

  ## Associations
  belongs_to :user, optional: true, dependent: :destroy
  belongs_to :city, optional: true
  has_many :skill_volunteers, dependent: :destroy
  has_many :skills, through: :skill_volunteers
  has_one_attached :profile_pic

  has_many :activity_registrations
  has_many :activities, through: :activity_registrations



  accepts_nested_attributes_for :skills

  ## Scopes
  scope :filter_by_region_id,   -> (region_id)   { where city_id:  Region.find_by(id: region_id).cities.pluck(:id)   }
  scope :by_city, -> (city_id) { where(city_id: city_id) }
  scope :by_causes, -> (arr_causes) { where( 'causes && ARRAY[?]::integer[]', arr_causes ) }
  
  @data = YAML.load_file( 'lib/data/data.yml' )

  def get_causes
    Cause.where(id: self.causes)
  end

  def assign_new_user
    u = User.create!(email: self.email, password: (0...8).map { ('a'..'z').to_a[rand(26)] }.join)
    u.add_role(:volunteer)
    self.user_id = u.id
  end

  def set_skills skill_ids
    self.skill_ids=skill_ids
  end

  def complete_personal?
    !picture_url.blank? and !name.blank? and !email.blank? and !phone_whatsapp.blank? and 
    !father_name.blank? and !dob.blank? and !cnic.blank? and !gender.blank? and !blood_group.blank? and 
    !city.blank? and !current_address.blank? and !hometown_address.blank?
  end

  def complete_professional?
    !educational_institute.blank? and !degree_department.blank? and !education_level.blank? and 
    !subject_area.blank? #and !education_status.nil?
  end

  def complete_time_investment?
    skill_volunteers.any? and !area_of_interest.blank? and get_causes.any? and !availability.blank? and 
    !availability_days.blank? and marketing_medium.any?
  end

  def complete_socialization?
    !about_yourself.blank?# and !facebook_link.blank? and !twitter_link.blank? and !linkedin_link.blank? and 
    # !instagram_link.blank? and !snapchat_link.blank?
  end

  def complete?
    complete_personal? and complete_professional? and complete_time_investment? and complete_socialization?
  end

  def self.misc_data
    @data
  end
end