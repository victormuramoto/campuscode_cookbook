Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  root 'home#index'
  resources :recipes, only:[:new, :create, :edit, :update, :show, :destroy] do
    member do
      post 'like'
    end
    member do
      post 'unlike'
    end
    collection do
      get 'favorite'
    end
  end
  resources :kitchens, only:[:new, :create, :show]
  resources :food_types, only:[:new, :create, :show]
  resources :food_preferences, only:[:new, :create, :show]

end
