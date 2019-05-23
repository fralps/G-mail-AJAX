Rails.application.routes.draw do
  devise_for :users
  root to: "emails#index"
  resources :tasks, except: [:show]
  resources :emails, only: [:index, :create, :show, :destroy]
end
