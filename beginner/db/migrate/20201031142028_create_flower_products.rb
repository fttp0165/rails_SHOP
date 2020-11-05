 class CreateFlowerProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :flower_products do |t|

    	t.string :name
    	t.string :description
    	t.string :image_url
      	t.timestamps
    end
  end
end
