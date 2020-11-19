class Page < ApplicationRecord
  validates :name, :content, :permalink, presence: true
end
