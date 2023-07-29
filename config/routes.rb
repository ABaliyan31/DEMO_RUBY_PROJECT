Rails.application.routes.draw do

  get '/signup', to: 'users#new'
  resources :microposts do
    resources :comments
  end

  resources :users

end
