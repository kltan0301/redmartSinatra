class RedmartSinatra < Sinatra::Base
  get '/' do
    erb 'Hello World'
  end
  get '/tables/:id' do
    if(params[:id] == 'users')
      @headers = User.column_names
      @items = User.all
    elsif (params[:id] == 'products')
      @headers = Product.column_names
      @items = Product.all
    elsif(params[:id] == 'orders')
      @headers = Order.column_names
      @items = Order.all
    elsif(params[:id] == 'purchases')
      @headers = Purchase.column_names
      @items = Purchase.all
    elsif(params[:id] == 'categories')
      @headers = Category.column_names
      @items = Category.all
    elsif(params[:id] == 'brands')
      @headers = Brand.column_names
      @items = Brand.all
    end
    erb :'tableView'
  end
end
