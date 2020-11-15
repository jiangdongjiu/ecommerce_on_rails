class Province < ApplicationRecord
  has_many :customers

  validates :name, presence: true
  validates :pst, :gst, :hst, numericality: { allow_nil: true }
end
