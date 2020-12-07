Rails.application.routes.draw do
  devise_for :users
  root to: "runners#index"
  resources :articles do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :meals do
    resources :meal_favorites, only: [:create, :destroy]
    resources :meals_comments, only: [:create, :destroy]
  end  

  resources :users, only: [:edit, :show, :update]
end
