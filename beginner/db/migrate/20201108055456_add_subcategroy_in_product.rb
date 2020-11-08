 class AddSubcategroyInProduct < ActiveRecord::Migration[5.2]
  def change

  	add_column :flower_products,:flower_sub_category_id,:integer
  	add_index :flower_products,:flower_sub_category_id
  end
end
