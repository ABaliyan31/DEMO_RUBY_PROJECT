Rails.application.routes.draw do

  get 'sessions/new'
  get '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :microposts do
    resources :comments
    get '/restore', to: 'microposts#restore'
    get '/destroy', to: 'microposts#destroy_post'
  end

  resources :users do
   get '/recyclebin', to: 'users#recycle_bin'
  end


end
