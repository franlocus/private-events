Rails.application.routes.draw do
  devise_for :users
  root "events#index"
  resources :invitations, only: [:create]
  resources :events, only: [:index, :new, :create, :show]
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
