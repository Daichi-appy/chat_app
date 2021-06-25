Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  root 'posts#index'
  get 'chats/index'
  get 'chats/:id' => 'chats#show', as: 'chat'
  get 'users/index', to: "users#index"
  devise_for :users
  devise_scope :user do
    #deviseのsign_upが失敗した時の処理
    get '/users', to: 'devise/registrations#new'
  end
  
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  resources :posts, only: [:index, :create, :destroy] do
    resource :likes, only: [:create, :destroy]
  end
  resources :chats, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
