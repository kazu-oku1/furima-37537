Rails.application.routes.draw do
  # post "favorites/:item_id/create" => "favorites#create"
  # post "s/:tweet_id/destroy" => "likes#destroy"
  devise_for :users
  root to: "items#index"
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :purchases, only: [:index, :create]
    resource :favorites, only: [:create, :destroy]
  end
end