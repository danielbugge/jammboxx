Rails.application.routes.draw do


  devise_for :users
  root to: 'pages#home'

  resources :jamms, only: [ :index, :show, :new, :create ]

  resources :instruments, only: [ :show, :new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
