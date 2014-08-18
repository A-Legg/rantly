Rails.application.routes.draw do

  root "rantly#index"

  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"

end