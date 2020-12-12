Rails.application.routes.draw do
  get 'orders/index'
  devise_for :users
  resources :items do
    resources :transactions, only: [ :index, :create]
  end
  root to: 'items#index'
end
