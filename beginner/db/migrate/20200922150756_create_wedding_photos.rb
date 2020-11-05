class CreateWeddingPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :wedding_photos do |t|
      t.string :name
  	  t.string :image_url
      t.timestamps
    end
  end
end
