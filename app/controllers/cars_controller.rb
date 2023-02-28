class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  before_action :set_car, only: %i[ show edit update destroy ]

  def index
    @cars = Car.all
  end

  def show
    @car = Car.new
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to @car, notice: 'Car was successfully added.'
    else
      render :new
    end
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:garden).permit(:brand, :model, :location, :number_plate, :capacity, :year, :price)
  end
end
