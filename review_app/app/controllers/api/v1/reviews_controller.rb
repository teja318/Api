class Api::V1::ReviewsController < Api::V1::ApiController

	 skip_before_action :verify_authenticity_token 


	 def index

	 	@reviews = Review.all
	 	render json: @reviews
	 end



    def edit
     	@review = Review.find(params[:id])
     	render json: @review
	end

    def update
	@review = Review.find(params[:id])
	if @review.update_attributes(:body => params[:body], :rating => params[:rating], :product_id => params[:product_id])
	render json: @review
	
	end
	end
	
    def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path, notice: "successfully destroyed the review"
    end	

	def show 
	@review = Review.find(params[:id])
	render json: @review
	end

    def fetch_by_product
    	@reviews = Review.where('product_id=?',params[:product_id])
        render json: @reviews
    end		
 

end
