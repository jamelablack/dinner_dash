Rails.application.routes.draw do
  root to: 'items#index', as: '/home'

  get '/sign_in', to: 'sessions#new'
  get '/sign_out', to: 'sessions#destroy'

  resources :sessions, only: [:create]
end
