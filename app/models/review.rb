class Review < ApplicationRecord
  belongs_to :car
  belongs_to :booking

  validates :comment, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: 0..5 }

  # validate :unique_review

  # def unique_review
  #   if review.present? && review.persisted?
  #     errors.add(:base, "You can only create one review per booking")
  #   end
  # end
end
