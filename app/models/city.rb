class City < ApplicationRecord
  ## Associations
  belongs_to :region, optional: true
  has_many :volunteers
end
