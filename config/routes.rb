Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'posts#index'

  resources :posts do
   resources :comments, only: :create
   resources :favorites, only: [:create, :destroy]
   collection do
    get 'search'
  end
 end

  resources :users, only: :show do
    member do
      get :follows, :followers
    end
    resource :relationships, only: [:create, :destroy]
  end

  resources :ranks, only: :index
end
