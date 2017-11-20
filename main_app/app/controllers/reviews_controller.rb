class ReviewsController < ApplicationController

   skip_before_action :verify_authenticity_token 

  def index
  	@reviews = HTTParty.get("http://localhost:3003/api/v1/reviews")
  end


  def new
    @products = HTTParty.get("http://localhost:3002/api/v1/products")
     
      @result = JSON.parse(@products.body)
  end

  def create
   @review = HTTParty.post("http://localhost:3003/api/v1/api", body: {review: {Body: params[:body],Rating: params[:rating],Product: params[:product_id]}})
   redirect_to reviews_path
  end

  def edit
   @review = HTTParty.get("http://localhost:3003/api/v1/reviews/#{params["id"]}")
   @products = HTTParty.get("http://localhost:3002/api/v1/products")
  @result = JSON.parse(@products.body)
  end

  def update
     @review = HTTParty.patch("http://localhost:3003/api/v1/reviews/#{params["id"]}", Body: {body: params[:body], rating: params[:rating], product_id: params[:product_id]})
   
     redirect_to reviews_path
  end
  def show
  	@review = HTTParty.get("http://localhost:3003/api/v1/reviews/#{params[:id]}")
    @product = HTTParty.get("http://localhost:3002/api/v1/products/#{@review["product_id"]}")
    
  end

  
end
