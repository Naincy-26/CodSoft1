class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :buses, dependent: :destroy
         has_many :reservations
         enum role: { user: 0, admin: 1 }

def owner?
  # Your implementation for determining if the user is an owner
  # This method should return true or false based on your logic
end

        end
