Rails.application.routes.draw do

  root "welcome#show"

  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"
  delete "signout" => "sessions#destroy", as: :signout

  get "users/new" => "users#new", as: :register
  post "users/new" => "users#create"

  get "users" => "users#index"

  get "users/:id" => "users#home", as: :users_index

end