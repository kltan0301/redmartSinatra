class RedmartSinatra < Sinatra::Base
  get '/' do
    erb 'Hello World'
  end
  get '/about' do
    erb 'About us'
  end
  #Get all users
  get '/users' do
    @headers = User.column_names
    @items = User.all

    erb :'user/index'
  end
  #Get for new user
  # get 'users/new' do
  #   @
  # end

  #Get specific user
  get '/users/:id' do
    @user = User.find(params[:id])
    @headers = User.column_names
    erb :'user/show'
  end


end
