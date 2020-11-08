# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

			# (1..100).each do |index|
			# 		bundle_flower={
		 #   			name: "花火",
		 #   			description: "玫瑰美式捧花",
		 #   			image_url: "flower_picture/DSC_0083.JPG"
   # 					}
   # 				FlowerProduct.create(bundle_flower)
   # 			end


   flower_categories=[
   						{
					   	"name":"捧花","flower_sub_categories": [
					   		"美式捧花",
					   		"圓形捧花",
					   		"扇形捧花",
					   		"客制化捧花"
					   	]
					   },
					   {
					   	"name":"配件","flower_sub_categories": [
					   		"胸花",
					   		"手腕花"
					   	]
					   	}
                      ]


flower_categories.each do |c_data|
	category=FlowerCategory.create(name: c_data[:name])
	 c_data[:flower_sub_categories].each do |s_data|
	 	subcategory=FlowerSubCategory.create(name: s_data, flower_category: category)
	 end
end

subcategory=FlowerSubCategory.all[1]
   					(1..30).each do |index|
					bundle_flower={
		   			name: "花火",
		   			description: "玫瑰美式捧花",
		   			image_url: "flower_picture/DSC_0083.JPG",
		   			flower_sub_category: subcategory
   					}
   				FlowerProduct.create(bundle_flower)
   			end