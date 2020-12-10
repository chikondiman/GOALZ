Rails.application.routes.draw do
  namespace :api do
    get "/intentions" => "intentions#index"
    get "/intentions/:id" => "intentions#show"
    post "/intentions/" => "intentions#create"
    patch "/intentions/:id" => "intentions#update"
    delete "/intentions/:id" => "intentions#destroy"

    post "/users" => "users#create"

    get "/users" => "users#create"

    post "/sessions" => "sessions#create"
  end
end
