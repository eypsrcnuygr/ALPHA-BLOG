Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/about', to: 'pages#about'
  resources :articles
  root to: 'pages#home'
  get '/signup', to: 'users#new'
  resources :users, except: [:new]
end
