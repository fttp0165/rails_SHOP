class CartItem < ApplicationRecord

	belongs_to :cart
	belongs_to :flower_product
	
end
