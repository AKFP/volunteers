Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "volunteers#index"

  draw :api

  resources :volunteers do
    collection do
      get :thank_you
    end
  end
end
