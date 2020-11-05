class AddPriceinFlowerProduct < ActiveRecord::Migration[5.2]
  def change
  	add_column :flower_products,:price,:integer
  end
end
