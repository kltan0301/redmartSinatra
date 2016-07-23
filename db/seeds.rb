require './models/user'
require 'faker'

(0..5).each do |x|
 # @new_user = User.new
 # @new_user[:name] = 'abc'

 User.create(name: Faker::StarWars.character, email: Faker::Internet.email, password: Faker::Internet.password, cc_number:Faker::Business.credit_card_number)
end
