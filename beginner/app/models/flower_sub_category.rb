class FlowerSubCategory < ApplicationRecord
	belongs_to :flower_category
	has_many :flower_products

	def name_with_category
		"#{flower_category.try(:name)}"+"/"+"#{name}"
	end
end
