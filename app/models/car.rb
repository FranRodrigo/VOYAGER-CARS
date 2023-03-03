class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos
  has_many :reviews, dependent: :destroy

  validates :brand, :model, :location, :number_plate, :capacity, :year, :price, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_location,
    against: [ :location ],
    using: {
      tsearch: { prefix: true }
    }

  def owner?(user)
    self.user == user
  end
end
