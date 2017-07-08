Rails.application.routes.draw do
  root to: 'home#index', as: 'home'

  resources :posts

  resources :conversations, only: [:index, :create, :destroy] do
    resource :messages, only: [:show, :new, :create, :destroy]
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :posts, only: [:index, :show, :create, :update, :destroy]
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :conversations, only: [:index, :create] do
        resources :messages, only: [:show, :new, :create, :destroy]
      end
    end
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  resources :maps, only: :index

  mount ActionCable.server => '/cable'
end
