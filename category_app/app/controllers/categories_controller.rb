class CategoriesController < ApplicationController


    skip_before_action :verify_authenticity_token 

	def new
	@category = Category.new
	render json: @category
	end

	def create
    @category = Category.new(params[:category].permit(:name))
	if @category.save
    render json: @category

	else
	render json: @category.errors
	end
	end	

	


end
