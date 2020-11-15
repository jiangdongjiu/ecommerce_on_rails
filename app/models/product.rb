class Product < ApplicationRecord
  belongs_to :category
  has_many :order_details

  validates :name, :price, :stock, :description, presence: true
  validates :price, numericality: true
  validates :stock, numericality: { only_integer: true }
end
