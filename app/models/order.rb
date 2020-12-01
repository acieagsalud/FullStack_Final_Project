class Order < ApplicationRecord
  belongs_to :user
  validates :total, :subtotal, :gst, :pst, numericality: true
  validates :order_date, :total, :subtotal, :gst, :pst, :status, :stripe_id, presence: true
end
