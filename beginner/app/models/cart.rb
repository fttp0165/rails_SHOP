class Cart < ApplicationRecord
	belongs_to :user 
	has_many :cart_items
	enum cart_type:[:buy_now,:buy_next_time]
	validates :cart_type, inclusion: { in: %w(buy_now buy_next_time),
		message: "%{value} is not valid cart type." }
	def amount
	  @amount =0
	  cart_items.each do |item|
	    @amount+=item.quantity * (item.product_price ) 	
	  end
	  @amount
	end

end
