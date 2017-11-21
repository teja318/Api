class Api::V1::CategoriesController < ApplicationController

   skip_before_action :verify_authenticity_token 

	def index
    @categories  = Category.all
    render json: @categories
	end

	def edit
     	@category = Category.find(params[:id])
     	render json: @category
	end

    def update
	@category = Category.find(params[:id])
	#binding.pry
	if @category.update_attributes(:name => params[:name])
		render json: @category
	
	end
	end
    
    def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, notice: "successfully destroyed the category"
    end

    def show
	 @category = Category.find(params[:id])
     render json: @category
    end	
end
