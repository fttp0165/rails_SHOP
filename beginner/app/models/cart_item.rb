class CartItem < ApplicationRecord

	belongs_to :cart
	belongs_to :flower_product

	def flower_product_name
	  flower_product.try(:name) || ""
	end
	def flower_product_price
	  flower_product.try(:price) || ""
	end
	
	def product_price
	  @price=flower_product.price
	  if !@price || @price<0
		return 0
	  end
	  return @price 
	end
end
