class Product < ApplicationRecord
  belongs_to :manufacturer
  belongs_to :subcategory

  validates :name, :price, :stock_qty, :description, presence: true
  validates :price, :stock_qty, :sale_price, numericality: true
end
