class OrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :order_price, :quantity, presence: true
  validates :order_price, numericality: true
  validates :quantity, numericality: { only_integer: true }
end
