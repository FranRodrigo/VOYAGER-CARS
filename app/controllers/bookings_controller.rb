class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @car = Car.find(params[:car_id])
    @booking.car = @car

    @booking.user = current_user

    if @booking.save
      redirect_to car_path(@car)
      flash[:notice] = "Thanks for booking"
    else
      flash[:alert] = "Booking not successful"
      render "cars/show"
    end
  end

  private

  def booking_params
    params.required(:booking).permit(:pickup_day, :return_day)
  end
end
