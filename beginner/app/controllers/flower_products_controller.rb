class FlowerProductsController < ApplicationController
	before_action	:redirect_to_index_if_not_login, except:[:index,:show,:flower_products]
	before_action 	:get_page
	before_action 	:get_pageation
	before_action 	:get_all_category,only:[:index,:flower_products]
	#PRODUCT_COUNT=100
	LIMIT_PRODUCT_NUMBER=20


	def index
			# @bundle_flower = []
			# @first_page=1
			# @bundle_flower =FlowerProduct.all 
			# @last_page=(@bundle_flower.count/LIMIT_PRODUCT_NUMBER)
			# if (@bundle_flower.count % LIMIT_PRODUCT_NUMBER)>1
			# 	@last_page += 1
			# end
			# if params[:page]
			# 	@page=params[:page].to_i
			# else
			# 	@page=1
			# end

			
			# (1..PRODUCT_COUNT).each do |index|
			# 	bundle_flower={
		 #   			id:index,
		 #   			name: "花火",
		 #   			description: "玫瑰美式捧花",
		 #   			image_url: "flower_picture/DSC_0083.JPG"
   # 					}
			#<< bundle_flower
		
			# @bundle_flower=@bundle_flower[(@page-1)*LIMIT_PRODUCT_NUMBER,LIMIT_PRODUCT_NUMBER]  
		
			#採用位移讀取資料庫比原先方法（讀取整個table 取出所需部份 200筆資料快2.3msec）好
			##@bundle_flower=@bundle_flower.offset((@page-1)*LIMIT_PRODUCT_NUMBER).limit(LIMIT_PRODUCT_NUMBER)
	end


	def new
		@note=flash[:name]
		@product=FlowerProduct.new
	end

	def show
	@product=FlowerProduct.find_by_id(params[:id])
	end

	def create

	image=params[:flower_product][:image]
	if image
		image_url=save_file(image)
    end
	flower_product=FlowerProduct.create(flower_product_permit.merge({image_url:image_url})) 
	#flower_product_permit#取代以下{
		# name: params[:name],
		# description: params[:description],
		# image_url: params[:imsge_url]#{}"flower_picture/DSC_0083.JPG"}

	flash[:notice]="建立成功"
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
		image=params[:flower_product][:image]
		if image
			image_url=save_file(image)
			flower_product.update(flower_product_permit.merge({image_url:image_url}))
		else
			flower_product.update(flower_product_permit)
		end
		flash[:notice]="更新成功"
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
	private
	def flower_product_permit
		params.require(:flower_product).permit([:name,:description,:price,:flower_sub_category_id])
	end

	def redirect_to_index_if_login
		if current_user
			flash[:notice]="已經登入了"
			redirect_to action: :index ,controller: :flower_products
			return
		end
	end



	def redirect_to_index_if_not_login
		if !current_user || !current_user.is_admin?
			flash[:notice]="您沒有權限"
			redirect_to action: :index ,controller: :flower_products
			return
		end
	end

	def save_file(newFile)
		dir_url=Rails.root.join('app/assets/','images/upload/flower_products')
		FileUtils.mkdir_p(dir_url) unless File.directory?(dir_url)
		file_url=dir_url+newFile.original_filename
		File.open(file_url,'w+b') do |file|
			file.write(newFile.read)
		end
		return 'upload/flower_products/'+newFile.original_filename
	end

	def get_current_page
			if params[:page]
				@page=params[:page].to_i
			else
				@page=1
			end
	end

	def get_products    
		@bundle_flower =FlowerProduct.includes(:flower_sub_category).includes(:flower_category).all
		
	end
	def get_pageation
			@first_page=1
			count=@bundle_flower.count
			@last_page=(count/LIMIT_PRODUCT_NUMBER)
			if (count % LIMIT_PRODUCT_NUMBER)
				@last_page += 1
			end
			@bundle_flower=@bundle_flower.offset((@page-1)*LIMIT_PRODUCT_NUMBER).limit(LIMIT_PRODUCT_NUMBER)
	end
	def get_all_category
		@flower_category=FlowerCategory.includes(:flower_sub_category).all
	end
	def get_page
		get_current_page
		get_products
		get_all_category
	end

	



end
