Rails.application.routes.draw do
  root to: 'items#index', as: '/home'
  get '/sign_in', to: 'sessions#new'
  resources :sessions, only: [:create]
end
