class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  def show
    @car = Car.find(params[:id])
    @booking = Booking.new
  end
end
