Rails.application.routes.draw do
  devise_for :users

  resources :profiles do
    resources :addresses
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "profiles#index"
end
