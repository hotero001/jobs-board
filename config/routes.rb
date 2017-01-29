Rails.application.routes.draw do
  root 'jobs#index', as: '/'

  resources :jobs
  get '/jogger', to: 'jobs#driver_method'
  get '/engineering', to: 'jobs#engineering_jobs'
  get '/callcenter', to: 'jobs#call_center_jobs'
  get '/education', to: 'jobs#education_jobs'

  get '/abastecimiento', to: 'jobs#abastecimiento'
  get '/administracion', to: 'jobs#administracion'
  get '/aduana', to: 'jobs#aduana'
  get '/comercial', to: 'jobs#comercial'
  get '/comunicacion', to: 'jobs#comunicacion'  
  get '/diseno', to: 'jobs#diseno'
  get '/gastronomia', to: 'jobs#gastronomia'
  get '/gerencia', to: 'jobs#gerencia'
  get '/legales', to: 'jobs#legales'
  get '/marketing', to: 'jobs#marketing'
  get '/mineria', to: 'jobs#mineria'
  get '/oficios', to: 'jobs#oficios'
  get '/produccion', to: 'jobs#produccion'
  get '/rh', to: 'jobs#rh'
  get '/salud', to: 'jobs#salud'
  get '/secretarias', to: 'jobs#secretarias'
  get '/seguros', to: 'jobs#seguros'
  get '/tech', to: 'jobs#tech'

  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
