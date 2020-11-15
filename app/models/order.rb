class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details

  validates :shipping_address, :status, presence: true
end
