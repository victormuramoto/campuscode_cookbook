Rails.application.routes.draw do
  devise_for :admins
  root 'home#index'
  resources :recipes, only:[:new, :create, :show]
  resources :kitchens, only:[:new, :create, :show]

end
