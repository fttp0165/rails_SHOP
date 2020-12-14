class FlowerProduct < ApplicationRecord

	has_many :cart_items
	has_many :order_items
	belongs_to :flower_sub_category
	mount_uploader  :image_url, ImageUploadUploader
	validates :name,:description,presence:true

end
