Rails.application.routes.draw do
  root "events#index"
  get "users/profile"

  devise_for :users
  resources :events
end
