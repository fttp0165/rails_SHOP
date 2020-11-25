class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :carts

         after_create :create_cart

         def create_cart
         if self.carts.blank?
          Cart.buy_now.create(user: self)
          Cart.buy_next_time.create(user: self)
         end
         end
end
