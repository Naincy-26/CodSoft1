class Bus < ApplicationRecord
  belongs_to :user
  has_many :reservations
  validates :timing, presence: true

  def available_seats
    seats - reservations.sum(:seats)
  end

  def self.search(query)
    where("LOWER(name) LIKE :query OR LOWER(route) LIKE :query", query: "%#{query.downcase}%")
  end
end
