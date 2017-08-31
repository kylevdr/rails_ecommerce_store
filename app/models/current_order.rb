class CurrentOrder < ApplicationRecord
  belongs_to :user
  belongs_to :order
  validates :user, presence: true
  validates :order, presence: true
end
