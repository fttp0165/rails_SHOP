class SubcategoriesController < ApplicationController
	before_action :get_category,only:[:flower_products]
	before_action :get_subcategory,only:[:flower_products]
	def flower_products
	end
	def get_category
	end
	def get_subcategory
	end
end
