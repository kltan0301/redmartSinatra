require 'sinatra/base'
require 'sinatra/flash'

class RedmartSinatra < Sinatra::Base

  get '/' do
    erb 'Welcome to Redmart Sinatra'
  end
  get '/about' do
    erb 'About us'
  end

end
