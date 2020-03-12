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
JoinTableCartItem.destroy_all
Order.destroy_all

kitty_pictures = ["https://cdn.pixabay.com/photo/2020/01/29/21/57/cat-4803841_960_720.jpg",
    "https://cdn.pixabay.com/photo/2014/11/30/14/11/kitty-551554_960_720.jpg", 
    "https://cdn.pixabay.com/photo/2016/03/28/10/05/kitten-1285341_960_720.jpg", 
    "https://cdn.pixabay.com/photo/2019/11/08/11/56/cat-4611189_960_720.jpg", 
    "https://cdn.pixabay.com/photo/2016/11/29/01/10/adorable-1866475_960_720.jpg",
    "https://cdn.pixabay.com/photo/2018/05/30/19/29/cat-3442257_960_720.jpg"]


10.times do 
  User.create(
		first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name,
		address: Faker::Address.street_address,
		email: Faker::Internet.email,
		password: "123456")
end 

9.times do 
  Item.create(
		title: Faker::Name.first_name, 
		description: Faker::Lorem.paragraph,
		price: Faker::Number.decimal(l_digits: 2),
		image_url: kitty_pictures.sample,
		admin_id: rand(User.first.id..User.last.id))
end 

10.times do 
    Cart.create(
			customer_id: rand(User.first.id..User.last.id))
end

10.times do 
  JoinTableCartItem.create(
		cart_id: rand(Cart.first.id..Cart.last.id),
		item_id: rand(Item.first.id..Item.last.id))
end 

10.times do
	Order.create(
		user_id: rand(User.first.id..User.last.id),
		cart_id: rand(Cart.first.id..Cart.last.id),
		delivery_address: Faker::Address.street_address, 
		items_number: Faker::Number.number(digits: 1),
		total_order: Faker::Number.decimal(l_digits: 2))
end



    