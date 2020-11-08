class CreateFlowerSubCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :flower_sub_categories do |t|

      t.timestamps
      t.string :name
      t.string :description
      t.string :image_url
      t.belongs_to :flower_category
    end
  end
end
