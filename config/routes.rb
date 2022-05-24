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

  # Routes for Inventories. These *only* need to be created.
  get 'inventories/:id', to: 'inventories#show', as: 'inventory'

  # Routes for Coffees
  get 'coffees', to: 'coffees#index'
  get 'coffees/new', to: 'coffees#new', as: 'new_coffee'
  post 'coffees', to: 'coffees#create'
  get 'coffees/:id/edit', to: 'coffees#edit', as: 'edit_coffee'
  post 'coffees/:id/edit', to: 'coffees#update'
  delete 'coffees/:id', to: 'coffees#destroy', as: 'coffee'
  patch '/coffees/:id', to: 'coffees#update'

  # Routes for Carts
  get 'carts/new', to: 'carts#new', as: 'new_cart'

  root to: 'coffees#index'
end
