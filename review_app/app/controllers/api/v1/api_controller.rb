class Api::V1::ApiController < ApplicationController

   skip_before_action :verify_authenticity_token

  def new
    @review = Review.new
    render json: @review
  end
    
  def create

	@review = Review.new(params[:review].permit(:body, :rating, :product_id))
  binding.pry
	if @review.save
    binding.pry
		render json: @review
	else
	  render json: @review.errors
	end
  end



  
end
