Rails.application.routes.draw do
  root to: 'items#index', as: '/home'
end
