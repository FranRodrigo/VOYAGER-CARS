class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_car, only: %i[ edit update ]

  def index
    @cars = Car.all
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
    if @car.save
      redirect_to car_path(@car), notice: 'Car was successfully added.'
    else
      render :new
    end
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:brand, :model, :location, :number_plate, :capacity, :year, :price, photos: [])
  end
end
