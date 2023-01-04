module CustomTokenResponse
  def body
    u = User.find_by(id: @token.resource_owner_id)
    additional_data = {
      # use any global storage like RequestStore / Rails Current / etc
      'email' => u.email,
      'user_id' => @token.resource_owner_id, # you have an access to the @token object
      'volunteer_name' => u.volunteer.try(:name), # volunteer name
      'volunteer_id' => u.volunteer.try(:id), # volunteer id
      'volunteer_complete' => u.volunteer.try(:complete?) # is volunteer information complete
    }

    # call original `#body` method and merge its result with the additional data hash
    super.merge(additional_data)
  end
end