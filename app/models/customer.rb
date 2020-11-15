class Customer < ApplicationRecord
  belongs_to :province
  has_many :orders

  validates :fullname, :username, :password, :email, presence: true
end
