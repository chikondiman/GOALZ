Rails.application.routes.draw do
  namespace :api do
    get "/intentions" => "intentions#index"
  end
end
