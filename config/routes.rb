Rails.application.routes.draw do
  root to: "rooms#index"
  resources :rooms
  devise_for :users
  mount ActionCable.server => '/cable'
end
