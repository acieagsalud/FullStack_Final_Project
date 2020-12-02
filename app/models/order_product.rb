class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, :purchase_price, numericality: true
  validates :quantity, :purchase_price, presence: true
end
