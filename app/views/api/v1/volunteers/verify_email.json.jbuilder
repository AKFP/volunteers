json.success      @user ? true : false
json.messages     ["#{@user ? 'Email verified' : 'Email not verified'}"]