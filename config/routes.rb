Rails.application.routes.draw do

  root "welcome#show"

  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"
  delete "signout" => "sessions#destroy"

  get "users/new" => "users#new", as: :register
  post "users/new" => "users#create"

  get "users" => "users#index"

end