Rails.application.routes.draw do
  get 'topics/index'

  get 'topics/show'

  get 'topics/new'

  get 'topics/edit'

  get 'welcome/index'

  get 'welcome/about'
  resources :topics
  
  devise_for :users

  root to: "welcome#index"
end
