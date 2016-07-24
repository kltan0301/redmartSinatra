require 'rubygems'
require 'bundler'
Bundler.require

#for models
require './models/user'
require './models/product'
require './models/order'
require './models/purchase'
require './models/category'
require './models/brand'

#for controllers
require './app'
require './controllers/user_controller'
require './controllers/product_controller'

#allow delete and put request
use Rack::MethodOverride
run RedmartSinatra
