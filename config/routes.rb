Rails.application.routes.draw do

  resources :articles
  devise_for :users

  resources :users
  resources :home

  authenticate :user do
    resources :categories, only: [:new, :create, :edit, :destroy, :update]

    scope '/admin' do

      resource :users, only: [:user_manager] do
        get :user_manager
      end
    end

  end
  resources :categories, only: [:index, :show]

  resources :posts do
    member do
      post :lock
      post :unlock
    end
    resources :comments
  end


  root 'home#index'

end
