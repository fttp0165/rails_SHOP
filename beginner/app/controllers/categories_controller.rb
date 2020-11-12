class CategoriesController < FlowerProductsController
	before_action :get_category,only:[:flower_products]
	before_action 	:get_page,only:[:index,:flower_products]
	before_action 	:get_pageation,only:[:index,:flower_products]
	# LIMIT_PRODUCT_NUMBER=20
	def flower_products
			# @bundle_flower = []
			# @first_page=1

			# @last_page=(@bundle_flower.count/LIMIT_PRODUCT_NUMBER)
			# if (@bundle_flower.count % LIMIT_PRODUCT_NUMBER)>1
			# 	@last_page += 1
			# end
			# if params[:page]
			# 	@page=params[:page].to_i
			# else
			# 	@page=1
			# end
			# @flower_category=FlowerCategory.all
			# @bundle_flower=@bundle_flower.offset((@page-1)*LIMIT_PRODUCT_NUMBER).limit(LIMIT_PRODUCT_NUMBER)
	end

	# private
	def get_products
		@bundle_flower=@category.flower_products
	end
	def get_category
		@category=FlowerCategory.find_by_id(params[:category_id])
	end
	


end
