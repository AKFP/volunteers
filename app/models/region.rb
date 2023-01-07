class Region < ApplicationRecord
  ## Associations
  has_many :cities
  has_many :users
end
