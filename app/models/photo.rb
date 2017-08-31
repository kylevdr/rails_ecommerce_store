class Photo < ApplicationRecord
  belongs_to :product
  validates :product, presence: true
  validates :description, length: { maximum: 255 }
end
