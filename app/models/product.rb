class Product < ApplicationRecord
  belongs_to :manufacturer
  belongs_to :subcategory

  validates :name, :price, :stock_qty, presence: true
end
