class ProductsController < ApplicationController
 
  skip_before_action :verify_authenticity_token 


	def index
      @products = HTTParty.get("http://localhost:3002/api/v1/products")
	end

	def new
      @categories = HTTParty.get("http://localhost:3001/api/v1/categories")
      @result = JSON.parse(@categories.body)
    end

	def create
      #@response = (@result.collect {|p| [p["name"],p["id"]] })
      #binding.pry
      @product = HTTParty.post("http://localhost:3002/products", body: {product: {name: params[:name],price: params[:price],category_id: params[:category_id]}})
   	  #binding.pry
   	  redirect_to products_path
    end


	def show 
	  @product = HTTParty.get("http://localhost:3002/api/v1/products/#{params[:id]}")
      @category = HTTParty.get("http://localhost:3001/api/v1/categories/#{@product["category_id"]}")
	  @reviews = HTTParty.get("http://localhost:3003/api/v1/reviews/fetch_by_product?product_id=#{@product["id"]}")
	end

  def edit
   @product = HTTParty.get("http://localhost:3002/api/v1/products/#{params["id"]}")
   @categories = HTTParty.get("http://localhost:3001/api/v1/categories")
  @result = JSON.parse(@categories.body)
  end

  def update
     @product = HTTParty.patch("http://localhost:3002/api/v1/products/#{params["id"]}", body: {name: params[:name], price: params[:price], category_id: params[:category_id]})
   
     redirect_to products_path
  end


		
end
