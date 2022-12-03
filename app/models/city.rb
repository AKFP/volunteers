class City < ApplicationRecord
  ## Associations
  belongs_to :region, optional: true
end
