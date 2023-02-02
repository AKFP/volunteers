module Api::ActivitiesModule
  extend ActiveSupport::Concern

  included do
    def register
      begin
        @registration = ActivityRegistration.create!(activity_id: params[:id], volunteer_id: current_user.volunteer.id, status: :registered)
      rescue Exception => e

      end
    end
  end
end