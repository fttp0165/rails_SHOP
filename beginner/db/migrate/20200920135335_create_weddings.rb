class CreateWeddings < ActiveRecord::Migration[5.2]
  def change
    create_table :weddings do |t|
       t.string :name
  	  t.string :image_url
      t.timestamps
    end
  end
end
