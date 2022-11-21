module CustomTokenResponse
  def body
    u = User.find_by(id: @token.resource_owner_id)
    additional_data = {
      # use any global storage like RequestStore / Rails Current / etc
      'email' => u.email,
      'userid' => @token.resource_owner_id # you have an access to the @token object
      # any other data
    }

    # call original `#body` method and merge its result with the additional data hash
    super.merge(additional_data)
  end
end