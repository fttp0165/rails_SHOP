class SubcategoriesController < FlowerProductsController
	before_action :get_category,only:[:flower_products]
	before_action :get_subcategory,only:[:flower_products]
	before_action :get_page,only:[:index,:flower_products]
	before_action :get_pageation,only:[:index,:flower_products]
		LIMIT_PRODUCT_NUMBER=20
		def flower_products
			
		end

		private
		def get_products
			@bundle_flower =@subcategory.flower_products
		end
		def get_category
			@category=FlowerCategory.find_by_id(params[:category_id])
		end
		def get_subcategory
			@subcategory=FlowerSubCategory.find_by_id(params[:subcategories_id])
		end
end
