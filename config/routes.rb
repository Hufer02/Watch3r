Rails.application.routes.draw do
  devise_for :users
  root to: "lists#index"

  resources :lists do
    resources :bookmarks, only: [ :new, :create, :edit, :update ]
  end
  resources :bookmarks, only: :destroy
end
