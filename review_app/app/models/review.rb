class Review < ActiveRecord::Base

	validates_presence_of :body, :rating, :product_id
end
