class RedmartSinatra < Sinatra::Base
  get '/' do
    erb 'Hello World'
  end
  get '/Profile' do
    @users = User.all
    erb :'userView'
  end
end
