class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @car = Car.find(params[:car_id])
    @booking = current_user.bookings.find_by(car_id: @car.id)

    if !@booking.present? || @car.owner?(current_user)
      redirect_to @car, alert: 'You are not allowed to review this car (yet).'
      return
    end

    if current_user.wrote_review_for?(@booking)
      redirect_to @car, alert: 'You have already written a review for this car'
    end

    @review = @car.reviews.new(review_params)
    @review.booking = @booking

    if @review.save
      redirect_to @car, notice: 'Review was successfully created.'
    else
      render "cars/show", status: :unprocessable_entity
    end
  end
  # def create
  #   @car = Car.find(params[:car_id])
  #   @review = Review.new(review_params)
  #   @review.car = @car
  #   if @review.save
  #     redirect_to car_path(@car)
  #   else
  #     render "cars/show", status: :unprocessable_entity
  #   end
  # end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
