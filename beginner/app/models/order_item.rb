class OrderItem < ApplicationRecord

    belongs_to :order
    belongs_to :flower_product
end
