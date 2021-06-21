Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users
  devise_scope :user do
    #deviseのsign_upが失敗した時の処理
    get '/users', to: 'devise/registrations#new'
  end
  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
