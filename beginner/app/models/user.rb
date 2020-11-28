class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :carts
         has_many :orders
         after_create :create_carts

        def buy_now_cart
          carts.buy_now.first
        end

        def buy_next_time_cart
          carts.buy_next_time.first
        end
         private
         def create_carts
            if self.carts.blank?
              Cart.buy_now.create(user: self)
              Cart.buy_next_time.create(user: self)
            end
         end
end
