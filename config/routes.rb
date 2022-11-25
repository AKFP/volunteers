Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "hello#index"
  resources :hello

  draw :api


  namespace :admin do
    resources :volunteers, only: [:index, :show] do
      member do
        post :update_status
      end
    end
  end

  resources :volunteers do
    collection do
      get :thank_you
    end
  end

end



# Rails.application.routes.draw do
#   devise_for :users, controllers: {
#     sessions: 'users/sessions'
#   }
# end
