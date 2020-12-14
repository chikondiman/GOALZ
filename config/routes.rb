Rails.application.routes.draw do
  namespace :api do
    get "/intentions" => "intentions#index"
    get "/intentions/:id" => "intentions#show"
    post "/intentions/" => "intentions#create"
    patch "/intentions/:id" => "intentions#update"
    delete "/intentions/:id" => "intentions#destroy"
  end
end
