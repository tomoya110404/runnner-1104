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

  resources :users, only: [:create, :edit, :show, :update]
  get "users/:id/editsub", to:  "users#editsub"
  patch "users/:id/updatesub", to: "users#updatesub"
  
end
