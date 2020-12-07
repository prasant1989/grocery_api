Rails.application.routes.draw do
  resources :categories
  resources :orders do
    collection do
      get :pending
      get :fullfilled
      get :cancelled
    end
    member do
      get :details
      post :fullfill
      post :reject
    end
  end
  resources :catalogs
  resources :users, only: :create do
    collection do
      post 'confirm'
      post 'login'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
