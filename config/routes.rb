Rails.application.routes.draw do

  root "welcome#show"

  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"

  get "signout" => "sessions#destroy", as: :signout

  resources 'users'

  # get "users/new" => "users#new", as: :register
  # post "users/new" => "users#create"
  #
  # get "users" => "users#index"
  #
  # get "users/:id" => "users#dashboard", as: :dashboard

end