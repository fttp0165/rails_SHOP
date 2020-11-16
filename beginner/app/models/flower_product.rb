class FlowerProduct < ApplicationRecord

	has_many :cart_items
	belongs_to :flower_sub_category
	mount_uploader  :image_url, ImageUploadUploader
	
end
