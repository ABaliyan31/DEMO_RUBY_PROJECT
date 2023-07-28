Rails.application.routes.draw do

  resources :microposts do
    resources :comments
  end

  resources :users
end
