Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :products do
    resources :user_carts, only: [:new, :create]
  end
  resources :user_carts, only: [:index, :destroy]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
