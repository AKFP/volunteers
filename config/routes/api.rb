namespace :api do
  namespace :v1 do
    scope :users, module: :users do
      post '/', to: 'registrations#create', as: :user_registration
    end
    resources :volunteers do
      collection do
        post :verify_email
      end
    end
    resources :activities do
      member do
        post :register
      end
    end
    resources :static_data, only: [:index]
    resources :cities, only: [:index]
    resources :causes, only: [:index]
    resources :skills, only: [:index]
  end
end

scope :api do
  scope :v1 do
    use_doorkeeper do
      skip_controllers :authorizations, :applications, :authorized_applications
    end
  end
end