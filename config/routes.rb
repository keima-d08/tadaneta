Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'posts#index'

  resources :posts do
   resource :comments, only: :create
   resource :favorites, only: [:create, :destroy]
   collection do
    get 'search'
  end
 end
 resources :comments, only: :destroy

  resources :users, only: [:show, :index] do
    member do
      get :follows, :followers, :favorites
    end
    resource :relationships, only: [:create, :destroy]
  end

  resources :ranks, only: :index
end
