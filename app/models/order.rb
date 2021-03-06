class Order < ApplicationRecord
  belongs_to :user

  has_many :order_details
  has_many :products, through: :order_details

  accepts_nested_attributes_for :order_details, allow_destroy: true

  validates :shipping_address, :status, presence: true
  validates :order_pst, :order_gst, :order_hst, numericality: { allow_nil: true }
  validates :grand_total, numericality: true
end
