class FlowerProductsController < ApplicationController

	PRODUCT_COUNT=100
	LIMIT_PRODUCT_NUMBER=20


	def index
			@bundle_flower = []
			@first_page=1
			
			@bundle_flower =FlowerProduct.all 
			@last_page=(@bundle_flower.count/LIMIT_PRODUCT_NUMBER)
			if (@bundle_flower.count % LIMIT_PRODUCT_NUMBER)>1
				@last_page += 1
			end
			

			if params[:page]
				@page=params[:page].to_i
			else
				@page=1
			end

			# (1..PRODUCT_COUNT).each do |index|
			# 	bundle_flower={
		 #   			id:index,
		 #   			name: "花火",
		 #   			description: "玫瑰美式捧花",
		 #   			image_url: "flower_picture/DSC_0083.JPG"
   # 					}
			#<< bundle_flower
		
			# @bundle_flower=@bundle_flower[(@page-1)*LIMIT_PRODUCT_NUMBER,LIMIT_PRODUCT_NUMBER]  
			@bundle_flower=@bundle_flower.offset((@page-1)*LIMIT_PRODUCT_NUMBER).limit(LIMIT_PRODUCT_NUMBER)
			#採用位移讀取資料庫比原先方法（讀取整個table 取出所需部份 200筆資料快2.3msec）好
			
	end


	def new
		@note=flash[:name]
		@product=FlowerProduct.new
	end

	def create
	flower_product=FlowerProduct.create(flower_product_permit) 
	#flower_product_permit#取代以下{
		# name: params[:name],
		# description: params[:description],
		# image_url: params[:imsge_url]#{}"flower_picture/DSC_0083.JPG"}

	flash[:name]=flower_product.id
	redirect_to action: :new
	end


	def edit
		@product=FlowerProduct.find_by_id(params[:id])
		if @product.blank?
			redirect_to action: :index
		end

	end

	def update
		
		flower_product=FlowerProduct.find(params[:id])
		flower_product.update(flower_product_permit)
		redirect_to action: :edit
	end

	def destroy
		flower_product=FlowerProduct.find(params[:id])
		flower_product.destroy
		redirect_to action: :index
		# flower=FlowerProduct.all.offset(1).limit(60)
		# flower.each do |p|
		# 	if p.id >10
		# 		p.destroy
		# 	end
		# end
	end

	def flower_product_permit
		params.require(:flower_product).permit([:name,:description,:image_url])
	end

end
