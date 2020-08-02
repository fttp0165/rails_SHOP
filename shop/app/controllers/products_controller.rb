class ProductsController < ApplicationController

  PRODUCTS_COUNT=100
  LIMITED_PROFUCTS_NUMBER=20
  def index
     @ad={
       title: "大型廣告",
       des: "這是廣告",
       action_title:"閱讀更多"
     }

      if params[:page]
        @page=params[:page].to_i-1
      else
        @page=0
      end
       @products=Product.all
      @first_page=1
      if (@products.count % LIMITED_PROFUCTS_NUMBER)
        @last_page=(  @products.count / LIMITED_PROFUCTS_NUMBER+1)
       else
          @last_page=(  @products.count / LIMITED_PROFUCTS_NUMBER)
       end
         @products=@products.offset(@page*  LIMITED_PROFUCTS_NUMBER).limit(LIMITED_PROFUCTS_NUMBER)
  end

    def new
        @note=flash[:note]
        @product=Product.new
    end

    def create
      product=Product.create(product_permit)
      flash[:note] =product.id
      redirect_to  action: :new
    end

    def show
          @product =Product.find_by_id(params[:id])
    end


    def edit
          @product =Product.find_by_id(params[:id])
          if @product.blank?
              redirect_to root_path
              return
          end
    end

    def update
      product =Product.find(params[:id])
      product.update(product_permit)
      redirect_to action: :edit
    end
    def destroy
        product=Product.find(params[:id])
        product.destroy
        redirect_to action: :index
    end
   def product_permit
       params.require(:product).permit([:name,:description,:image_url,:price])
    end
end
