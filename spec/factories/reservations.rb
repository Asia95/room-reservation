require 'date'

FactoryBot.define do

  factory :reservation do
    user
    room
    start_date { DateTime.parse("2018-10-03 10:00") }
    end_date { DateTime.parse("2018-10-03 14:00") }
  end
end