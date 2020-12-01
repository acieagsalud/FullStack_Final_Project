# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
Product.destroy_all

100.times do
  name = Faker::Commerce.unique.product_name
  product = Product.create(name:            name,
                        description:     Faker::TvShows::MichaelScott.quote,
                        price:           Faker::Number.within(range: 1500..20_000),
                        stock_qty:       Faker::Number.within(range: 0..75),
                        manufacturer_id: rand(1..6),
                        subcategory_id:  rand(1..5))
  downloaded_image = open(URI.open("https://source.unsplash.com/random/800x600/?#{name.split(' ')[2]}"))
  product.image.attach(io: downloaded_image, filename: "m-#{name.split(' ')[2]}.jpg")

  puts "Created #{product.name}"
  sleep(1)
end
