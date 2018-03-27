class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :room

  validates_datetime :start_date, presence: true
  validates_datetime :end_date, presence: true, after: :start_date
  #validates :user, presence: true
  #validates :room, presence: true

  scope :recent, -> { where("start_date >= :date", { date: DateTime.now })}

  scope :past, -> { where("start_date < :date", { date: DateTime.now })}
end
