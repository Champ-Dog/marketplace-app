Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # Routes for Profiles
  get 'profiles/edit', to: 'profiles#edit', as: 'edit_profile'
  get 'profiles/:id', to: 'profiles#show', as: 'profile'
  patch 'profiles/:id', to: 'profiles#update'
  patch 'profiles/:id/merchant', to: 'profiles#merchant', as: 'profile_merchant'
  patch 'profiles/:id/customer', to: 'profiles#customer', as: 'profile_customer'

  # Routes for Addresses
  get 'addresses/new', to: 'addresses#new', as: 'new_address'
  post 'addresses', to: 'addresses#create'
  get 'addresses/:id/edit', to: 'addresses#edit', as: 'edit_address'
  get 'addresses/:id', to: 'addresses#show', as: 'address'
  delete 'addresses/:id', to: 'addresses#destroy'
  patch '/addresses/:id', to: 'addresses#update'

  # Routes for Inventories
  get 'inventories/:id', to: 'inventories#show', as: 'inventory'

  # Routes for Coffees
  get 'coffees/new', to: 'coffees#new', as: 'new_coffee'
  post 'coffees', to: 'coffees#create'
  get 'coffees/:id/edit', to: 'coffees#edit', as: 'edit_coffee'
  get 'coffees/:id', to: 'coffee#show', as: 'coffee'
  delete 'coffees/:id', to: 'coffee#destroy'
  patch '/coffees/:id', to: 'coffees#update'
  post 'coffees/:id/edit', to: 'coffees#update'

  # resources :users do
  #  resources :profiles do
    # resources :addresses
  #  end
  # end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "profiles#show"
end
