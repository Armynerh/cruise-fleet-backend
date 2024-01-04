class Item < ApplicationRecord
  has_many :reservations
  has_many_attached :images
end
