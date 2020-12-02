class Province < ApplicationRecord
  validates :gst_rate, :pst_rate, numericality: true
  validates :name, :gst_rate, :pst_rate, presence: true
end
