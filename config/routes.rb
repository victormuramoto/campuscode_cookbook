Rails.application.routes.draw do
  devise_for :admins
  resources :recipes, only:[:new,:create,:show]
  root 'home#index'
end
