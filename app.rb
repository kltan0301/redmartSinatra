class RedmartSinatra < Sinatra::Base
  get '/' do
    erb 'Hello World'
  end
  get '/users' do
    @headers = User.column_names
    @items = User.all
    erb :'tableView'
  end
  get '/products' do
    @headers = Product.column_names
    @items = Product.all
    erb :'tableView'
  end
  get '/orders' do
    # @headers = Order.column_names
    # @items = Order.all
    # erb :'tableView'
    erb 'This table has not been created yet.'
  end
  get '/purchases' do
    @headers = Purchase.column_names
    @items = Purchase.all
    erb :'tableView'
  end
  get '/categories' do
    @headers = Category.column_names
    @items = Category.all
    erb :'tableView'
  end
  get '/brands' do
    @headers = Brand.column_names
    @items = Brand.all
    erb :'tableView'
  end
end
