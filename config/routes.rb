Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
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
  resources :users, only:[:show]

end
