Rails.application.routes.draw do

  devise_for :users

  resources :home
  resources :categories

  resources :posts do
    resources :comments
  end


  root 'home#index'

end
