# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PRODUCTS_COUNT=100
(1..PRODUCTS_COUNT).each do |index|
      product={
          name:"flower",
          description: "很美的花 ",
          image_url:"https://images.pexels.com/photos/3392982/pexels-photo-3392982.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260"
        }
        Product.create(product)
end
