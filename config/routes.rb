Rails.application.routes.draw do
  devise_for :users
  root to: 'items#new'
  
  resources :users
  resources :items do
    resource :favorites
  end

  
end
