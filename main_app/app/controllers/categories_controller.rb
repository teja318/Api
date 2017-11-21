class CategoriesController < ApplicationController

     
  skip_before_action :verify_authenticity_token 

	def index
	#binding.pry
	@categories = HTTParty.get("http://localhost:3001/api/v1/categories")
	#binding.pry
	end 

	def show 
	  @category = HTTParty.get("http://localhost:3001/api/v1/categories/#{params[:id]}")
	  @products = HTTParty.get("http://localhost:3002/api/v1/products/fetch_by_category?category_id=#{@category["id"]}")
	end	
   
    def new
    
    end	

	def create	
	 	@category = HTTParty.post("http://localhost:3001/categories", body: {category: {name: params[:name]}})
   		redirect_to categories_path
    end

    def edit
      @category = HTTParty.get("http://localhost:3001/api/v1/categories/#{params["id"]}")
      #binding.pry
      #@result = JSON.parse(@category.body)
	  #redirect_to categories_path
	end

	def update
     @category = HTTParty.patch("http://localhost:3001/api/v1/categories/#{params["id"]}", body: {name: params[:name]})
     redirect_to categories_path
    end

    def destroy
    @category = HTTParty.delete("http://localhost:3001/api/v1/categories/#{params["id"]}")
    
     redirect_to categories_path
    end
end
