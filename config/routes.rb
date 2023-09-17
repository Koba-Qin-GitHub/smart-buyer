Rails.application.routes.draw do
  devise_for :users
  root to: 'items#new'
  
  resources :users

  resources :items do
    resources :favorites

  end

  resources :favorites do
    resources :reminders
  end
  



  
end
