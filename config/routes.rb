Rails.application.routes.draw do
  root 'jobs#index', as: '/'

  resources :jobs
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
