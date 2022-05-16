Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get '/profiles', to: 'profiles#index', as: 'profiles'
  get '/profile/:id', to: 'profiles#show', as: 'profile'
  get '/profiles/:id/edit', to: 'profiles#edit', as: 'edit_profile'

  # resources :users do
  #  resources :profiles do
    resources :addresses
  #  end
  # end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "profiles#index"
end
