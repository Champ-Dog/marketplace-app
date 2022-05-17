Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # Routes for Profiles
  get '/profiles', to: 'profiles#index', as: 'profiles'
  get '/profiles/:id', to: 'profiles#show', as: 'profile'
  get '/profiles/:id/edit', to: 'profiles#edit', as: 'edit_profile'
  patch '/profile/:id', to: 'profiles#update'


  # Routes for Addresses
  get ':id/address/new', to: 'addresses#new', as: 'new_address'
  get '/addresses', to: 'addresses#index', as: 'addresses'
  post '/addresses', to: 'addresses#create'
  get '/addresses/:id/edit', to: 'addresses#edit', as: 'edit_address'
  get 'addresses/:id', to: 'addresses#show', as: 'address'
  patch 'addresses/:id', to: 'addresses#update'

  # resources :users do
  #  resources :profiles do
    # resources :addresses
  #  end
  # end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "profiles#index"
end
