Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root to: "runners#index"
  resources :articles do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    collection do
      get "search"
    end
  end


  resources :meals do
    resources :meal_favorites, only: [:create, :destroy]
    resources :meals_comments, only: [:create, :destroy]
    collection do
      get "search"
    end
  end  

  resources :users, only: [:new, :create, :edit, :show, :update] do
    member do
      get :following, :followers
    end
  end

  get "users/:id/editsub", to:  "users#editsub"
  patch "users/:id/updatesub", to: "users#updatesub"
  get "users/:id/celebration", to: "users#celebration"

  resources :relationships, only: [:create, :destroy]
  
end
