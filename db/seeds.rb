require './models/user'
require './models/category'
require './models/brand'
require './models/product'
require 'faker'

For creating dummy user data
(0..5).each do |_x|
  User.create(name: Faker::StarWars.character, email: Faker::Internet.email, password: Faker::Internet.password, cc_number: Faker::Business.credit_card_number)
end

For creating dummy category data
@categoryList = ['New', 'Marketplace', 'Fresh Produce', 'Meat & Seafood', 'Dairy & Chilled', 'Bakery', 'Frozen', 'Beverages', 'Food Cupboard', 'Alcohol', 'Health & Beauty', 'Household & Pet', 'Baby & Child', 'Home & Outdoor']

@categoryList.each do |category|
  Category.create(category_name: category)
end

For creating dummy brand data
(0..30).each do |_item|
  Brand.create(brand_name: Faker::Company.name)
end
brand_count = Brand.all.count
category_count = Category.all.count

# For creating dummy product data
(0..20).each do |_item|
  Product.create(name: Faker::Commerce.product_name, price: Faker::Commerce.price, brands_id: rand(1...brand_count), categories_id: rand(1...category_count), image_url: Faker::Placeholdit.image('150x150', 'jpg'))
end
