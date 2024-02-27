class AddSeatNumbersToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :seat_numbers, :integer
  end
end
