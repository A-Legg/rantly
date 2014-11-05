Rails.application.routes.draw do

  root "welcome#show"

  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"

  get "signout" => "sessions#destroy", as: :signout

  resources :users, only: [:new, :create, :show, :edit, :update] do
    resources :following_relationships, :path  => 'following', only: [:show, :create, :index, :destroy]
    post 'follow' => 'following_relationships#create'
    resources :favorites
    resources :comments, only: [:create]


  end



  resources :dashboard, only: [:show]
  resources :rants do
    resources :comments, only: [:create]
  end
  resources :searches, only: [:index]

  namespace :admin do
    resources :dashboard, only: [:show]
    resources :rants, only: [:index]
    resources :users, only: [:index]
  end






end