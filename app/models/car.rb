class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos

  validates :brand, :model, :location, :number_plate, :capacity, :year, :price, presence: true
end
