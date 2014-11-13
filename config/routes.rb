Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :links
  root "links#index"
end
