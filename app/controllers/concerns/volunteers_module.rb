module VolunteersModule
  extend ActiveSupport::Concern

  included do
    def update_status
      @volunteer.update(status: params[:status])
    end
  end
end