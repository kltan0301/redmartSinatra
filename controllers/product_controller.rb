require 'sinatra/base'

class RedmartSinatra < Sinatra::Base
  #Direct to screen to show all products
  get "/products" do
    @headers = Product.column_names
    @products = Product.all
    erb :'products/index'
  end
  # To direct user to blank page
  get "/products/new" do
    @brands_count = Brand.all.count
    @categories_count = Category.all.count
    erb :'products/new'
  end
  #Direct to edit screen
  get '/products/:id/edit' do
    @brands_count = Brand.all.count
    @categories_count = Category.all.count
    @product = Product.find(params[:id])
    erb :'products/edit'
  end
  #Finds individual products
  get "/products/:id" do
    @headers = Product.column_names
    @product = Product.find(params[:id])
    erb :'products/show'
  end
  #Method to create a new user
  post '/products' do
    puts params
    #create product
    @new_product = Product.new(params[:product])

    if @new_product.save
      flash[:notice] = "Product #{params[:product][:name]} has been added."
      redirect('/products')
    else
      flash[:notice] = "Product addition failed"
    end
  end
  #Method to update an existing user
  put '/products/:id' do
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      flash[:notice] = "Product #{params[:product][:name]}'s details have been updated."
      redirect('/products')
    end
  end
  #Method to remove an existing user
  delete '/products/:id' do

    @deleted_product = Product.find(params[:id])

    if @deleted_product.destroy
      flash[:notice] = "Product #{@deleted_product[:name]} has been deleted."
      redirect('/products')
    else
      erb :"products"
    end
  end
end
