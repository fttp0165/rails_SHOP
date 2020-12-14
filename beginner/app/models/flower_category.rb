class FlowerCategory < ApplicationRecord
	has_many :flower_sub_category
	has_many :flower_products, through: :flower_sub_category
	validates :name,presence:true
	validates :description,presence:true
end
