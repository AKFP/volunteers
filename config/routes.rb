Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "hello#index"
  resources :hello
  resources :products

  draw :api


  namespace :admin do
    resources :institutes
    resources :activities
    resources :cities, only: [:index]
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
