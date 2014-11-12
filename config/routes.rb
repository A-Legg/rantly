Rails.application.routes.draw do

  root "welcome#show"

  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"

  get "signout" => "sessions#destroy", as: :signout

  get "/disable/:id" => "admin#disable", as: :disable
  get "/enable/:id" => "admin#enable", as: :enable

  get '/confirm/:confirmation_token', :to => 'users#activate', via: [:post], as: 'confirmation'

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
  resources :spams, only: [:create, :destroy]



  namespace :admin do
    resources :dashboard, only: [:show]
    resources :rants, only: [:index, :destroy]
    resources :users, only: [:index]

    resources :spams, only: [:index, :destroy]
  end








end