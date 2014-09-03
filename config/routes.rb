Rails.application.routes.draw do

  root "welcome#show"

  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"

  get "signout" => "sessions#destroy", as: :signout

  resources 'users' do
    resources 'followings'

  end
  resources 'rants'


  # get "users/:id/followings" => "followings#index", as: :followings
  #
  # post "users/:id/follow" => "followings#create", as: :follow





  # get "users/new" => "users#new", as: :register
  # post "users/new" => "users#create"
  #
  # get "users" => "users#index"
  #
  # get "users/:id" => "users#dashboard", as: :dashboard

end