class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_car, only: %i[edit update show destroy]

  def show
    @booking = Booking.new
  end

  def index
    if params[:query].present?
      @cars = Car.search_by_location(params[:query])
    else
      @cars = Car.all
    end

    @markers = @cars.geocoded.map do |car|
      { lat: car.latitude,
        lng: car.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { car: car }),
        marker_html: render_to_string(partial: "marker") }
    end
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user

    if @car.save
      redirect_to car_path(@car), notice: 'Car was successfully added.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @car.update(car_params)
      redirect_to car_path(@car), notice: 'Car was successfully changed.'
    else
      render :new
    end
  end

  def destroy
    @car.destroy
    redirect_to dashboard_path, notice: 'Car was successfully deleted.'
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:brand, :model, :location, :number_plate, :capacity, :year, :price, photos: [])
  end
end
