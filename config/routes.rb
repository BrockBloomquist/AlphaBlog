Rails.application.routes.draw do
  resources :users
  resources :articles


  root "pages#home"
  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'session#create'
  delete 'logout', to: 'session#destroy'
  
end
