require 'sinatra/base'
require 'sinatra/flash'

class RedmartSinatra < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  #Get all users
  get '/users' do
    @headers = User.column_names
    @users = User.all

    erb :'users/index'
  end
  #Direct to add new user screen
  get '/users/new' do
    erb :'users/new'
  end

  #Get specific user
  get '/users/:id' do
    @user = User.find(params[:id])
    @headers = User.column_names
    erb :'users/show'
  end

  #Direct to edit screen
  get '/users/:id/edit' do
    @user = User.find(params[:id])
    erb :'users/edit'
  end

  #Method to create a new user
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
  #Method to remove an existing user
  delete '/users/:id' do

    @deleted_user = User.find(params[:id])

    if @deleted_user.destroy
      flash[:notice] = "User #{@deleted_user[:name]} has been deleted."
      redirect('/users')
    else
      erb :"users"
    end
  end
  #Method to update an existing user
  put '/users/:id' do
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "User #{params[:user][:name]}'s details have been updated."
      redirect('/users')
    end
  end
end
