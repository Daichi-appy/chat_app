Rails.application.routes.draw do
  root 'posts#index'
  get 'rooms/:id' => 'rooms#show', as: 'room'
  get 'users/index', to: "users#index"
  post 'guests/guest_sign_in', to: 'guests#new_guest'
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

  resources :posts do
    resources :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end
  resources :rooms, only: [:index, :show]
  resources :chats, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
