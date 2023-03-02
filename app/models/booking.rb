class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :user

  validates :pickup_day, presence: true
  validates :return_day, presence: true

  validate :date_cannot_be_in_the_past

  def date_cannot_be_in_the_past
    return unless pickup_day.present? && return_day.present?

    if pickup_day < Date.today
      add_past_date_error(errors, :pickup_day)
    end

    if return_day < Date.today
      add_past_date_error(errors, :return_day)
    end
  end

  def add_past_date_error(errors, attribute)
    errors.add(attribute, "can't be in the past")
  end
end
