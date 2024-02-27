class BusesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_owner, only: [:new, :create, :index_owner_reservations]

  
 
  def index_owner_reservations
    @bus = Bus.find(params[:id])
    @reservations = @bus.reservations
  end


  def index
    @buses = Bus.all
    @searched_buses = Bus.all
  end

  def show
    @bus = Bus.find(params[:id])
  end

  def new
    redirect_to root_path, alert: 'You are not authorized.' unless current_user.owner?
    @bus = current_user.buses.build
  end
  
  def create
    redirect_to root_path, alert: 'You are not authorized.' unless current_user.owner?
    @bus = current_user.buses.build(bus_params)
    # Rest of the code
  end
  
  def index_owner_reservations
    # Retrieve and display reservations for buses owned by the current user
    @buses = current_user.buses
    @reservations = Reservation.where(bus_id: @buses.pluck(:id))
  end
  
  def search
    if params[:from].present? && params[:to].present?
      @searched_buses = Bus.where("lower(route) LIKE :from OR lower(route) LIKE :to",
                                  from: "%#{params[:from].downcase}%",
                                  to: "%#{params[:to].downcase}%")
    else
      @searched_buses = Bus.all
    end
  
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @searched_buses }
    end
  end
  private

  def check_owner
    redirect_to root_path, alert: 'You are not authorized.' unless current_user.owner?
  end

  def set_bus
    @bus = current_user.buses.find_by(id: params[:id])

    unless @bus
      redirect_to buses_path, alert: 'Bus not found.'
    end
  end

  def bus_params
    params.require(:bus).permit(:name, :registration_no, :route, :seats)
  end
end