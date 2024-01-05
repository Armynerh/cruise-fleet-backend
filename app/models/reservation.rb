class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :start, :finish, presence: true
  validates :city, presence: true
  validates :day_cost, presence: true
  validates :total_days, presence: true
  validates :total_cost, presence: true
end
