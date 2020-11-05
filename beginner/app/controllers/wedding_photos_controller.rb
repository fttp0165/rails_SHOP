class WeddingPhotosController < ApplicationController
	LIMITED_WEDDING_NUMBER=20
	# before_action :get_user,only: [:new]
		before_action :get_current_user
		def get_current_user
			current_user_id=session[:current_user_id]
			if current_user_id
				@current_user=User.find_by_id(current_user_id)
				@current_user_name=@current_user.name
			end
		end


	def index

		if params[:page]
			@page=params[:page].to_i
		else
			@page=1
		end

		@first_page=1
		@wedding_pictures=WeddingPhoto.all
		count=@wedding_pictures.count
		@last_page=(count/LIMITED_WEDDING_NUMBER)
		if count%LIMITED_WEDDING_NUMBER
			@last_page+=1
		end
		@wedding_pictures=@wedding_pictures.offset((@page-1)*LIMITED_WEDDING_NUMBER).limit(LIMITED_WEDDING_NUMBER)
	end
	

	def new
		@weddingpotho=WeddingPhoto.new
	end

	def create

		image=params[:wedding_photo][:image]
		if image
			image_url=save_file(image)
		end
		wedding_pirctures=WeddingPhoto.create(wedding_photo_permit.merge({image_url: image_url}))
		 flash[:note]=wedding_pirctures.id
		 redirect_to  action: :new
	end

	def get_user
		# redirect_to wedding_path
	end
	def edit
		@weddingpotho=WeddingPhoto.find(params[:id])
	end
	def update
		weddingpotho=WeddingPhoto.find(params[:id])
		image=params[:wedding_photo][:image]
		if image
			image_url=save_file(image)
			weddingpotho.update(wedding_photo_permit.merge({image_url: image_url}))
		else
		weddingpotho.update(wedding_photo_permit)
		end
		redirect_to action: :edit
	end

	def destroy
		weddingpotho=WeddingPhoto.find(params[:id])
		weddingpotho.destroy
		redirect_to action: :index
	end

	def wedding_photo_permit
		params.require(:wedding_photo).permit([:name,:image_url])
	end
	def save_file(newFile)
		dir_url=Rails.root.join('public','upload/weddingpothos')
		FileUtils.mkdir_p(dir_url)unless File.directory?(dir_url)
		file_url=dir_url+newFile.original_filename
		File.open(file_url,'w+b')do |file|
			file.write(newFile.read)
		end

		return '/upload/weddingpothos/'+newFile.original_filename
	end
end
