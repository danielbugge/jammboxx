Rails.application.routes.draw do
  get 'jamms/index'

  get 'jamms/show'

  get 'jamms/new'

  get 'jamms/create'

  get 'jamms/update'

  get 'jamms/edit'

  get 'jamms/destroy'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
