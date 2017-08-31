class OrderItem < ApplicationRecord
  belongs_to :order
  validates :order, presence: true
  belongs_to :product
  validates :product, presence: true
  validates :quantity,
    presence: true,
    numericality: { only_integer: true, greater_than: 0 } 
end
