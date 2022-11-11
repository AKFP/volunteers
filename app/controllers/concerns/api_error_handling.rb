module ApiErrorHandling
  def respond_with_error(error, invalid_resource = nil)
    error = API_ERRORS[error]
    error['success'] = false
    error['messages'] = invalid_resource.errors.messages if invalid_resource
    render json: error, success: false
  end
end
