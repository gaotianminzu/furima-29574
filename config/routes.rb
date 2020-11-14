Rails.application.routes.draw do

  # root to: "items#index"
  root  "items#index"
  resources :items, only: :index
  
end
