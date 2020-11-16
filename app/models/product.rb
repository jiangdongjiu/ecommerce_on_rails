class Product < ApplicationRecord
  belongs_to :category
  has_many :order_details
  has_many :orders, through: :order_details

  accepts_nested_attributes_for :order_details, allow_destroy: true

  validates :name, :price, :stock, :description, presence: true
  validates :price, numericality: true
  validates :stock, numericality: { only_integer: true }
end
