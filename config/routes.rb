Rails.application.routes.draw do
  get 'static_page/home'
  get 'static_page/help'
  resources :microposts
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'static_page#home'

  # Defines the root path route ("/")
  # root "articles#index"
end
