class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.belongs_to :user
      t.string :user_name
      t.string :user_phone
      t.string :user_address
      t.integer :status
      t.timestamps
    end
  end
end
