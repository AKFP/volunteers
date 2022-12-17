module ActivitiesModule
  extend ActiveSupport::Concern

  included do
    def delete_picture
      @id = params[:id]
      ActiveStorage::Attachment.find_by(id: @id).purge
    end
  end
end