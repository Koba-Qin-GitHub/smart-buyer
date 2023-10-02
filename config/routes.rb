Rails.application.routes.draw do
  devise_for :users
  root to: 'items#new'
  
  resources :users, only:[:show, :edit, :update]

  resources :items, only:[:index, :new, :create, :show] do
    resources :favorites, only:[:create, :destroy]

  end

  resources :favorites, only:[:create, :destroy] do
    resources :reminders, only:[:new, :create, :destroy]
  end
  



  
end
