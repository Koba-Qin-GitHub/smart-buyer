Rails.application.routes.draw do
  devise_for :users
  root to: 'items#new'
  resources :users
  resources :items
  resources :favorites

  
end
