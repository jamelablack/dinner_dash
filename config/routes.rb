Rails.application.routes.draw do
  root to: 'items#index', as: '/home'
  get 'ui(/:action)', controller: 'ui'

  resources :items, only: [:index]

  resources :sessions, only: [:create]
end
