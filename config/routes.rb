Rails.application.routes.draw do
  root "events#homepage"
  get "users/profile"

  devise_for :users
  resources :events
end
