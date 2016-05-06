Rails.application.routes.draw do
  get 'likes/index'

  #get 'welcome/index'

  resources :topics do
    resources :bookmarks
  end

  resources :bookmarks, except: [:index] do
    resources :likes, only: [:create, :destroy]
  end

  devise_for :users

  resources :users, only: [:index, :show]

  resources :welcome, only: [:index]

  get 'welcome/about'
  root to: "welcome#index"

  post :incoming, to: 'incoming#create'
end
