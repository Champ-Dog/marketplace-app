# Make sure everything is destroyed to prevent conflict and begin with clean slate
Cart.destroy_all
Inventory.destroy_all
Profile.destroy_all
User.destroy_all

# Create merchants in the app
seller = User.create(email: 'merchant@hopper.com', password: 'merchant123')
seller_profile = Profile.create(user_id: seller[:id], username: 'Coffee Brokers', name: 'Merchant Acct',
                                contact_number: '0123456789')
seller_profile.add_role :merchant
seller_profile.create_inventory!

roaster = User.create(email: 'roaster@hopper.com', password: 'roaster123')
roaster_profile = Profile.create(user_id: roaster[:id], username: 'Coffee Merchants', name: 'Toby Wilson',
                                 contact_number: '0123456789')
seller_profile.add_role :merchant
seller_profile.create_inventory!

# Create Customer user account
buyer = User.create(email: 'buyer@hopper.com', password: 'buyer123')
buyer_profile = Profile.create(user_id: buyer[:id], username: 'Caffiend', name: 'Customer Acct',
                               contact_number: '0123456789')
buyer_profile.add_role :customer

# Populate the app with coffees
Coffee.create(name: 'Kamwangi', origin: 'Kenya', roast_type: 'Omni', price: 21.00, quantity: 35,
              inventory_id: roaster_profile.inventory[:id])
Coffee.create(name: 'Pedro Moreno', origin: 'Honduras', roast_type: 'Omni', price: 21.60, quantity: 35,
              inventory_id: roaster_profile.inventory[:id])
Coffee.create(name: 'Chelelektu', origin: 'Ethiopia', roast_type: 'Filter', price: 19.00, quantity: 50,
              inventory_id: seller_profile.inventory[:id])
Coffee.create(name: 'La Esperanza', origin: 'Colombia', roast_type: 'Espresso', price: 22.00, quantity: 45,
              inventory_id: seller_profile.inventory[:id])
