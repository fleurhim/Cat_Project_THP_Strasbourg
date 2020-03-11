# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Item.destroy_all
User.destroy_all
Cart.destroy_all

kitty_pictures = ["https://pixabay.com/fr/photos/kitty-cat-chaton-551554/","https://pixabay.com/fr/photos/chatons-animaux-de-compagnie-dormir-1916542/", "https://pixabay.com/fr/photos/cat-chaton-animal-de-compagnie-4803841/", "https://pixabay.com/fr/photos/chaton-cat-petit-chat-kitty-mignon-2288404/", "https://pixabay.com/fr/photos/chats-animaux-yeux-4889299/"]


10.times do 
    user = User.new(first_name: Faker::Name.first_name, 
                    last_name: Faker::Name.last_name,
                    address: Faker::Address.street_address,
                    email: Faker::Internet.email,
                    password: "123456")
    user.save
end 

10.times do
    order = Order.create(
        customer_id: rand(User.first.id..User.last.id),
        cart_id: rand(Cart.first.id..Cart.last.id),
        delivery_address: Faker::Address.street_address, 
        items_number: Faker::Number.number(digits: 1),
        total_order: Faker::Number.decimal(l_digits: 2)
        )
end

9.times do 
    item = Item.new(title: Faker::Name.first_name, 
                    description: Faker::Lorem.paragraph,
                    price: Faker::Number.decimal(l_digits: 2),
                    image_url: kitty_pictures.sample,
                    admin_id: rand(User.first.id..User.last.id))
    item.save
end 

10.times do 
    cart = Cart.create(customer_id: rand(User.first.id..User.last.id))
    cart.save
end

10.times do 
    content = JoinTableCartItem.new(cart_id: rand(Cart.first.id..Cart.last.id),
                                    item_id: rand(Item.first.id..Item.last.id))
    content.save
end 




    