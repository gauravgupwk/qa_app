Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :questions do
    resources :answers
  end

  get "profile/:id", to: "users#profile", as: "profile"
  post 'follow_profile/:id', to: 'users#follow', as: "follow_profile"
  post 'unfollow_profile/:id', to: 'users#unfollow', as: "unfollow_profile"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'select_topic', to: 'topics#select_topic'

end
