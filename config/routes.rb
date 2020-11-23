Rails.application.routes.draw do
  devise_for :users
  root to: "runners#index"
  resources :articles
end
