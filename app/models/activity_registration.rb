class ActivityRegistration < ApplicationRecord
  enum status: [:registered, :approved, :rejected]

  ## Associations
  belongs_to :activity
  belongs_to :volunteer
end
