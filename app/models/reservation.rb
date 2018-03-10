class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates_datetime :start_date, presence: true
  validates_datetime :end_date, presence: true, after: :start_date
  validates :user, presence: true
  validates :room, presence: true
end
