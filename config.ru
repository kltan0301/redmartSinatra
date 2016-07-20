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

#for controller
require './app'

run RedmartSinatra
