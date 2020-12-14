class OrderItem < ApplicationRecord

    belongs_to :order
    belongs_to :flower_product
    validates :quantity, numericality: { only_integer: true,greater_than:0 }
    validates :price, numericality: { only_integer: true,greater_than_or_equal_to:0 }
    
end
