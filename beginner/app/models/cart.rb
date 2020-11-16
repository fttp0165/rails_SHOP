class Cart < ApplicationRecord
	belongs_to :flower_user

	enum cart_type:[:buy_now,:buy_next_time]

end
