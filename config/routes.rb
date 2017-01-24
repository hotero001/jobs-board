Rails.application.routes.draw do
  root 'jobs#index', as: '/'

  resources :jobs
  get '/jogger', to: 'jobs#driver_method'
  get '/engineering', to: 'jobs#engineering_jobs'
  get '/callcenter', to: 'jobs#call_center_jobs'
  get '/education', to: 'jobs#education_jobs'
  
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
