class Order < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  has_many :order_items, dependent: :destroy
  validates  :status,
    presence: true, 
    inclusion: { in: ['IN_PROGESS', 'ORDERED', 'FULFILLED', 'CANCELLED'] }
  # date_placed
  # date_fulfilled
end
