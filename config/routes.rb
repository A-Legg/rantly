Rails.application.routes.draw do

  root "welcome#show"

  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"

  get "signout" => "sessions#destroy", as: :signout

  get "/disable/:id" => "admin#disable", as: :disable
  get "/enable/:id" => "admin#enable", as: :enable

  get "/confirm/:confirmation_token", :to => 'users#activate', via: [:post], as: 'confirmation'
  get "/admin/impersonate/:user_id" => "admin#impersonate", as: :impersonate
  get "/admin/unimpersonate" => "admin#unimpersonate", as: :unimpersonate

  post "/users/:user_id/comments" => "comments#user_comment", as: :user_comments
  post "rants/:rant_id/comments" => "comments#rant_comment", as: :rant_comments

  resources :users, only: [:new, :create, :show, :edit, :update] do
    resources :following_relationships, :path  => 'following', only: [:show, :create, :index, :destroy]

    resources :favorites

  end

  resources :dashboard, only: [:show]
  resources :rants do

  end
  resources :searches, only: [:index]
  resources :spams, only: [:create, :destroy]

  namespace :admin do
    resources :dashboard, only: [:show]
    resources :rants, only: [:index, :destroy, :show]
    resources :users, only: [:index]
    resources :spams, only: [:index, :destroy]
  end

end