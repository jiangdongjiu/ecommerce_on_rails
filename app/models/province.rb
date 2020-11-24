class Province < ApplicationRecord
  has_many :customers
  has_many :users

  validates :name, presence: true
  validates :pst, :gst, :hst, numericality: { allow_nil: true }
end
