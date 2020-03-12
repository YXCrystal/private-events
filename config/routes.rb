Rails.application.routes.draw do
  root "events#homepage"
  # get "users/profile"

  devise_for :users
  
  resources :events do 
    put :attending, on: :member
  end

  resources :users, only: [:edit, :update, :show] 
end
