class User < ApplicationRecord
  has_one_attached :avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :cars
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :email, presence: true, uniqueness: true
  validates :address, presence: true

  def wrote_review_for?(booking)
    reviews.any? { |review| review.booking == booking }
  end
end
