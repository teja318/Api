class ProductsController < ApplicationController


  skip_before_action :verify_authenticity_token 


     def new
     	@product = Product.new
     	render json: @product
     end
     	
	def create

	@product = Product.new(params[:product].permit(:name, :price, :category_id))
	if @product.save
	render json: @product 
	
	else
	render json: @product.errors
	end
	end	

end
