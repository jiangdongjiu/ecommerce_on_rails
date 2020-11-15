class OrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :order_price, :quantity, presence: true
end
