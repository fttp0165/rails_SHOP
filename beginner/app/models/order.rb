class Order < ApplicationRecord
    belong_to :user
    has_many  :order_items
end
