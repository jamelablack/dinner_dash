Rails.application.routes.draw do
  root to: 'pages#front'
  get 'ui(/:action)', controller: 'ui'

  resources :items, only: [:index]
  get '/home', to: 'items#index'

  resources :sessions, only: [:create, :destroy]
  get '/sign_out', to: 'sessions#destroy'

  namespace :admin do
    resources :items
  end
end
