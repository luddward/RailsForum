Rails.application.routes.draw do

  resources :articles
  devise_for :users

  resources :users
  resources :home

  authenticate :user do
    resources :categories, only: [:new, :create, :edit, :destroy, :update]
  end
  resources :categories, only: [:index, :show]

  resources :posts do
    resources :comments
  end


  root 'home#index'

end
