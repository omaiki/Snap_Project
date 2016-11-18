Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root 'welcome#index'

  get 'welcome', to: 'welcome#show'

  resources :users
  resources :sessions
  resources :screenshots

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
