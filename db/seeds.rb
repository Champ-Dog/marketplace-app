# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Cart.destroy_all
Inventory.destroy_all
Profile.destroy_all
User.destroy_all

seller = User.create(email: 'merchant@hopper.com', password: 'merchant123')
seller_profile = Profile.create(user_id: seller[:id], username: 'Coffee Brokers', name: 'Merchant Acct', contact_number: '0123456789')
seller_profile.add_role :merchant
seller_profile.create_inventory!

buyer = User.create(email: 'buyer@hopper.com', password: 'buyer123')
buyer_profile = Profile.create(user_id: buyer[:id], username: 'Caffiend', name: 'Customer Acct', contact_number: '0123456789')
buyer_profile.add_role :customer