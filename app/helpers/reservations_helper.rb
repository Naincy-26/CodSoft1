module ReservationsHelper
  def seat_status(seat_number)
    reserved_seats = @bus.reservations.pluck(:seat_numbers).flatten
    if reserved_seats.include?(seat_number)
      'btn-danger'
    else
      'btn-primary'
    end
  end
end