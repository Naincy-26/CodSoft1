class AddDepartureTimeToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :departure_time, :datetime
  end
end
