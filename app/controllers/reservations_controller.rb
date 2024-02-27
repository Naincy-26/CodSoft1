class ReservationsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_reservation, only: [:show]
  include ReservationsHelper

  def index
    @reservations = current_user.reservations
  end

  def new
    @bus = Bus.find(params[:bus_id])
  @reservation = @bus.reservations.build
  end
  def create
    @bus = Bus.find(params[:bus_id])
    @reservation = @bus.reservations.build(reservation_params)
    @reservation.user = current_user
  
    if @reservation.save
      redirect_to bus_reservation_path(@bus, @reservation), notice: 'Reservation was successfully created.'
    else
      render :new
    end
  end
  
  def show
    @reservation = Reservation.find(params[:id])
    @bus = @reservation.bus
    end
  
  def edit
    @bus = Bus.find(params[:bus_id])
    @reservation = @bus.reservations.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Bus not found"
    redirect_to root_path
  end
  
  def destroy
    @bus = Bus.find(params[:bus_id]) 
  
    @reservation = @bus.reservations.find_by(id: params[:id])
  
    if @reservation
      @reservation.destroy
      redirect_to @bus, notice: 'Reservation canceled successfully.'
    else
      redirect_to @bus, alert: 'Reservation not found.'
    end
  end
  def history
    @reservations = current_user.reservations
  end


  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:date, :seats, seat_numbers: [])
  end
  
end 
