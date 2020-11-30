Rails.application.routes.draw do
  devise_for :users
  root to: "runners#index"
  resources :articles do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  get 'articles/:id/checked', to: 'articles#checked'

  resources :meals do
    resources :meals_comments, only: [:create, :destroy]
  end  
end
