class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  has_many :products, through: :order_details

  accepts_nested_attributes_for :order_details, allow_destroy: true
  
  validates :shipping_address, :status, presence: true
end
