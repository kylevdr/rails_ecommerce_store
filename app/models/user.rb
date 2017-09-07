class User < ApplicationRecord
  has_many :orders
  has_one :current_order # solely used for finding cart
  has_one :cart, class_name: "Order", through: :current_order
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
    length: { maximum: 255 }
  has_secure_password
  validates :password,
    presence: true,
    length: { minimum: 8 }
  validates :admin, presence: true
end
