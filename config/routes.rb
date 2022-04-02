Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'posts#index'

  resources :posts do
   resources :comments, only: :create
   resources :favorites, only: [:create, :destroy]
   collection do
    get 'search'
  end
 end

  resources :users, only: :show
end
