require 'sinatra/base'
require 'sinatra/flash'

class RedmartSinatra < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
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
      flash[:notice] = "User #{params[:user][:name]} has been created."
      redirect('/users')
    else
      flash[:notice] = "User creation failed"
    end
  end

  delete '/users/:id' do

    @deleted_user = User.find(params[:id])

    if @deleted_user.destroy
      flash[:notice] = "User #{@deleted_user[:name]} has been deleted."
      redirect('/users')
    else
      erb :"users"
    end
  end

  put '/users/:id' do
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "User #{params[:user][:name]}'s details have been updated."
      redirect('/users')
    end
  end
end
