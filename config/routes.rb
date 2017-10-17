Rails.application.routes.draw do

  root 'home#index'

  resources :articles

  get 'signup' => 'users#new'
  resources :users, except: [:new]

  resources :categories, except: [:destroy]

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
