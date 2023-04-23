class Api::V1::PasswordResetsController < ApiController
  include ApiErrorHandling
  skip_before_action :doorkeeper_authorize!

  def create
    user = User.find_by(email: params[:email])

    if user.present?
      token = PasswordResetToken.create(user_id: user.id, token: SecureRandom.uuid, expires_at: 1.hour.from_now)
      UserMailer.with(user: user, token: token).password_reset.deliver_now
      render json: { message: 'Password reset instructions sent to your email.' }
    else
      render json: { error: 'User not found.' }, status: :not_found
    end
  end

  def verify_token
    token = PasswordResetToken.find_by(token: params[:token])

    if token.present? && token.expires_at > Time.now
      @user = User.find(token.user_id)
      render json: { success: 'The token is valid.' }, status: :ok
    else
      render json: { error: 'Invalid or expired token.' }, status: :not_found
    end
  end

  def update
    token = PasswordResetToken.find_by(token: params[:token])
    return render json: { error: 'Invalid or expired token.' }, status: :not_found unless token

    if token.expires_at > Time.now
      @user = token.user

      if @user.update!(password: params[:password])
        token.destroy
        render json: { message: 'Password updated.' }
      else
        render json: { error: 'Password not updated.' }, status: :unprocessable_entity
      end
    end
  end

end
