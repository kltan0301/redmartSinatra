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

  get '/users/new' do
    erb :'user/new'
  end

  #Get specific user
  get '/users/:id' do
    @user = User.find(params[:id])
    @headers = User.column_names
    erb :'user/show'
  end

  get '/users/:id/edit' do
    @user = User.find(params[:id])
    erb :'user/edit'
  end

  post '/users' do
    puts params
    puts params[:user]

    #create user name, do it this way so you can check if user can be saved
    @new_user = User.new(params[:user])

    if @new_user.save
      redirect('/users')
    else

    end
  end

  delete '/users/:id' do

    @deleted_user = User.find(params[:id])

    if @deleted_user.destroy
      redirect('/users')
    else
      erb :"users"
    end
  end

  put '/users/:id' do
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect('/users')
    end
  end
end
