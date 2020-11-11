class SubcategoriesController < ApplicationController
	before_action :get_category,only:[:flower_products]
	before_action :get_subcategory,only:[:flower_products]
		LIMIT_PRODUCT_NUMBER=20
		def flower_products
			@bundle_flower = []
			@first_page=1

			@bundle_flower =@subcategory.flower_products
			@last_page=(@bundle_flower.count/LIMIT_PRODUCT_NUMBER)
			if (@bundle_flower.count % LIMIT_PRODUCT_NUMBER)>1
				@last_page += 1
			end
			if params[:page]
				@page=params[:page].to_i
			else
				@page=1
			end
			@flower_category=FlowerCategory.all
			@bundle_flower=@bundle_flower.offset((@page-1)*LIMIT_PRODUCT_NUMBER).limit(LIMIT_PRODUCT_NUMBER)
			
	end
	def get_category
		@category=FlowerCategory.find_by_id(params[:category_id])
	end
	def get_subcategory
		@subcategory=FlowerSubCategory.find_by_id(params[:subcategories_id])
	end
end
