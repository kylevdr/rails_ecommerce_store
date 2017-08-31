class Product < ApplicationRecord
  belongs_to :category
  validates :category, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :price, presence: true
  validates :description, length: { maximum: 1000 }
end
