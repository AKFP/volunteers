namespace :api do
  namespace :v1 do
    scope :users, module: :users do
      post '/', to: 'registrations#create', as: :user_registration
    end
    resources :volunteers
    resources :activities
    resources :static_data, only: [:index]
    resources :cities, only: [:index]
  end
end

scope :api do
  scope :v1 do
    use_doorkeeper do
      skip_controllers :authorizations, :applications, :authorized_applications
    end
  end
end