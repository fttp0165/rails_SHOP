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
             #(1..PRODUCTS_COUNT).each do |index|

                 # product={
                 #      id: index,
                 #     name:"flower#{index}",
                 #     description: "很美的花 ",
                 #     image_url:"https://images.pexels.com/photos/3392982/pexels-photo-3392982.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260"
                 #    }
        #      @products << product
        # end
         @products=@products.offset(@page*  LIMITED_PROFUCTS_NUMBER).limit(LIMITED_PROFUCTS_NUMBER)
  end

 def new
    @note=flash[:note]
 end

 def create
     flash[:note] =params[:name]
  redirect_to  action: :new
 end


end
