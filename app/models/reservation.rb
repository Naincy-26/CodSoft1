class Reservation < ApplicationRecord
  belongs_to :bus
  belongs_to :user
  serialize :seat_numbers, Array, coder: JSON


  validates :date, presence: true
  validates :seats, presence: true

  validate :unique_seat_numbers

  def unique_seat_numbers
    if seat_numbers.present? && seat_numbers.uniq.length != seat_numbers.length
      errors.add(:seat_numbers, "should be unique")
    end
  end
end
