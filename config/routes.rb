Rails.application.routes.draw do

  resources :articles
  devise_for :users

  resources :users do
    get :show_posts
  end
  resources :home

  authenticate :user do
    resources :categories, only: [:new, :create, :edit, :destroy, :update]

    scope '/admin' do

      resources :user_ranks do
        member do
          get :change_rank
          patch :save_user_rank
        end
      end

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
