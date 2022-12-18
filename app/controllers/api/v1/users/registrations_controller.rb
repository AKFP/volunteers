# frozen_string_literal = true

module Api
  module V1
    module Users
      class RegistrationsController < ApiController
        skip_before_action :doorkeeper_authorize!, only: %i[create]

        include DoorkeeperRegisterable

        def create
          client_app = Doorkeeper::Application.find_by(uid: user_params[:client_id])
          return render json: { error: I18n.t('doorkeeper.errors.messages.invalid_client') }, status: :unauthorized unless client_app

          allowed_params = user_params.except(:client_id)
          user = User.new(allowed_params)
          user.activation_code = SecureRandom.random_number(100000)

          if user.save
            UserMailer.welcome_email(user).deliver_later
            @Volunteer = Volunteer.create(name: params[:name], email: user_params[:email], user_id: user.id)
            user.reload

            render json: render_user(user, client_app), status: :ok
          else
            render json: { errors: user.errors }, status: :unprocessable_entity
          end
        end

        private
        def user_params
          params.permit(:email, :password, :client_id)
        end

      end
    end
  end
end