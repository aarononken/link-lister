Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  resources :comments, only: [:create, :destroy]
  resources :links do
    member do
      put "like", to: "links#upvote"
      put "dislike", to: "links#downvote"
    end
  end

  root "links#index"
end
