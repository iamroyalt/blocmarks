Rails.application.routes.draw do
  #get 'welcome/index'

  resources :topics do
    resources :bookmarks
  end

  devise_for :users

  resources :welcome, only: [:index]

  get 'welcome/about'
  root to: "welcome#index"
end
