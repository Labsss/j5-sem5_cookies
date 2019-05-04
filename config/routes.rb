Rails.application.routes.draw do
  root 'gossips#index'
  get 'welcome/:first_name', to: 'welcome#first_name'
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'
  resources :gossips
  resources :users
  resources :cities
  resources :comments
  resources :sessions, only: [:new, :create, :destroy]

end
