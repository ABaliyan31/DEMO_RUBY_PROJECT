Rails.application.routes.draw do

  resources :microposts do
    resources :comments
  end

  resources :users

  root 'static_page#home'

end
